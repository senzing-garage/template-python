# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Python template repository for Senzing projects. Provides boilerplate with PEP-8 compliant code, CLI support, configuration management, logging, and Docker support.

## Common Commands

All commands use Make targets from the repository root.

### Setup

```bash
make dependencies-for-development  # Install all dev dependencies (creates .venv)
make dependencies                   # Install runtime dependencies only
```

### Testing

```bash
make test      # Run all tests with pytest
make coverage  # Run tests with coverage report
```

Run single test:

```bash
source .venv/bin/activate
pytest tests/template_python_example_test.py::test_example_function
```

### Linting

```bash
make lint    # Run all linters (pylint, mypy, bandit, black, flake8, isort)
```

Individual linters: `make pylint`, `make mypy`, `make black`, `make flake8`, `make isort`, `make bandit`

### Other

```bash
make documentation  # Build Sphinx docs
make package        # Build wheel distribution
make docker-build   # Build Docker image
make clean          # Remove build artifacts
```

## Code Structure

- `src/template_python/` - Main package source
- `tests/` - Test files named `*_test.py`
- `makefiles/` - OS-specific Make includes (linux.mk, darwin.mk, windows.mk)

## Configuration

All tool configs in `pyproject.toml`:

- Line length: 120 characters
- Python: >=3.9
- mypy runs with `--strict`
- isort uses black profile

## Code Style

All Python code conforms to PEP-8 standard.
