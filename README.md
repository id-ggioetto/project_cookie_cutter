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

## Options

The following options are available when generating a project:

- `project_name`: The human-readable name of the project (e.g., "My Awesome Project").
- `project_slug`: The project slug, used for the directory name and Python package name (e.g., "my_awesome_project").
- `author_name`: Your name.
- `author_email`: Your email address.
- `project_short_description`: A one-sentence description of the project.
- `version`: The initial version of the project (e.g., "0.1.0").
- `python_version`: The version of Python you want to install and use (e.g., "3.11")
