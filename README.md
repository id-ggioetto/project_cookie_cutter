# My Cookiecutter Template

This is a template for creating Python projects based on my preferred setup.

## Usage

```bash
# Install cookiecutter if you haven't already
# pip install cookiecutter
uv pip install cookiecutter

# Generate a new project
cookiecutter . -o ~/Documents/ # This will create the new project in ~/Documents/
```

## Features (Template Setup)

This cookiecutter template generates a Python project with the following features configured:

- **Packaging:** Modern Python packaging using `pyproject.toml`, with `uv` as the default package manager.
- **Testing:** Ready for testing with `pytest` (includes `tests/` directory).
- **Linting & Formatting:** Enforced via `pre-commit` hooks. Common tools like `ruff`, `black`, `mypy`, and `codespell` are configured (see `pyproject.toml` and `.pre-commit-config.yaml` for details). The default line length is set to 100 characters. A `lint.sh` script is also included.
- **Containerization:** Docker support using `uv` for dependency installation, with `Dockerfile`, `.dockerignore`, and a specific linting Dockerfile (`Dockerfile_lint`).
- **Version Control:** Pre-configured `.gitignore`.
- **Editor Integration:** Includes settings for VS Code and cursor (`.vscode/`).
- **Basic Structure:** Standard source layout and a basic project `README.md`.
- **Code Organization:** Includes an example structure (`api/`, `core/`) demonstrating how to organize code into modules and import between them.

**Note**: This template **does not** include **CI/CD pipeline configuration**. You'll need to add your preferred CI/CD solution (e.g., GitHub Actions, GitLab CI, ...) based on your project's requirements.

## Options

The following options are available when generating a project:

- `project_name`: The human-readable name of the project (e.g., "My Awesome Project").
- `project_slug`: The project slug, used for the directory name and Python package name (e.g., "my_awesome_project").
- `author_name`: Your name.
- `author_email`: Your email address.
- `project_short_description`: A one-sentence description of the project.
- `version`: The initial version of the project (e.g., "0.1.0").
- `python_version`: The version of Python you want to install and use (e.g., "3.11")
