#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

echo "Ensuring lint dependencies are installed..."
uv sync --only-group lint

echo "Running pre-commit hooks..."
pre-commit run --all-files

echo "Linting checks passed!"
