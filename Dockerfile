# Define default values across multi-stages
ARG PROJECT_DIR=./example_project # TODO: change in case root folder is not example_project
ARG UV_DIR=/usr/local/bin/uv
ARG UV_PYTHON_INSTALL_DIR=/python
ARG PROJECT_DIR_DOCKER=/app
ARG UV_PROJECT_ENVIRONMENT=$PROJECT_DIR_DOCKER/.venv
ARG UV_VERSION=0.6.2
ARG UV_PYTHON=python3.11
ARG UV_COMPILE_BYTECODE=1
ARG UV_PYTHON_DOWNLOADS=never
ARG ENV UV_LINK_MODE=copy

# Stage: 'uv'
# It is used to define the uv Docker image
FROM ghcr.io/astral-sh/uv:$UV_VERSION AS uv

# Stage: 'env'
# It is used to define python version and install all the Python dependencies
FROM ubuntu:noble AS build

# Set location for python installed by uv
ARG UV_PYTHON_INSTALL_DIR
ENV UV_PYTHON_INSTALL_DIR=$UV_PYTHON_INSTALL_DIR

ARG PROJECT_DIR_DOCKER
WORKDIR $PROJECT_DIR_DOCKER

ARG UV_DIR
COPY --from=uv /uv $UV_DIR

ARG UV_LINK_MODE
ENV UV_LINK_MODE=$UV_LINK_MODE

ARG UV_COMPILE_BYTECODE
ENV UV_COMPILE_BYTECODE=$UV_COMPILE_BYTECODE

# Set /app/.venv for the virtual environment created by uv
ARG UV_PROJECT_ENVIRONMENT
ENV UV_PROJECT_ENVIRONMENT=$UV_PROJECT_ENVIRONMENT

# Define Python version
ARG UV_PYTHON
ENV UV_PYTHON=$UV_PYTHON

# Byte-compile the Python files for faster application startup
ARG UV_COMPILE_BYTECODE
ENV UV_COMPILE_BYTECODE=$UV_COMPILE_BYTECODE

# Copy the files with locked dependencies
COPY pyproject.toml uv.lock ./

# Install base dependencies
RUN --mount=type=cache,target=/root/.cache/uv \
   uv sync --frozen --no-install-project --no-editable --no-default-groups

# Stage: 'runtime'
FROM python:3.11-slim-bullseye AS run-image

ARG USER_ID=1000
ARG GROUP_ID=1000
ENV USER=app
ENV GROUP=app
RUN groupadd -g $GROUP_ID $GROUP && \
    useradd -u $USER_ID -g $GROUP_ID -ms /bin/bash $USER

# Set PATH to use the venv python
ARG UV_PROJECT_ENVIRONMENT
ENV PATH="$UV_PROJECT_ENVIRONMENT/bin:$PATH"

# Set /app/.venv for the virtual environment created by uv
ENV UV_PROJECT_ENVIRONMENT=$UV_PROJECT_ENVIRONMENT

ARG PROJECT_DIR_DOCKER
WORKDIR $PROJECT_DIR_DOCKER

# Copy uv, python and the installed packages
ARG UV_DIR
ARG UV_PYTHON_INSTALL_DIR
COPY --chown=$USER:$USER --from=build $UV_DIR $UV_DIR
COPY --chown=$USER:$USER --from=build $UV_PYTHON_INSTALL_DIR $UV_PYTHON_INSTALL_DIR
COPY --chown=$USER:$USER --from=build $UV_PROJECT_ENVIRONMENT $UV_PROJECT_ENVIRONMENT

# Prevent uv from downloading isolated Python builds as Python is already available
ARG UV_PYTHON_DOWNLOADS
ENV UV_PYTHON_DOWNLOADS=$UV_PYTHON_DOWNLOADS

# Byte-compile the python files for faster application startup
ARG UV_COMPILE_BYTECODE
ENV UV_COMPILE_BYTECODE=$UV_COMPILE_BYTECODE

# Copy application code separately
ARG PROJECT_DIR
COPY --chown=app:app $PROJECT_DIR $PROJECT_DIR

ENV PYTHONPATH=$PROJECT_DIR_DOCKER

CMD ["uv", "run", "example_project/core/main.py"]
