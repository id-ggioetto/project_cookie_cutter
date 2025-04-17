# {{ cookiecutter.project_name }}

### How to install all dependencies

```bash
uv sync --all-groups
```

### How to install only dependencies to run main

```bash
uv sync --no-default-groups
```

### How to install only dependencies to run servet

```bash
uv sync --no-default-groups --group api
```

### How to run main

```bash
uv run {{ cookiecutter.project_slug }}/core/converter.py
```
