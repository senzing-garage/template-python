# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Python template repository for Senzing projects. It provides boilerplate code with CLI argument parsing, configuration management (CLI > environment variables > defaults), structured logging, and Docker support.

## Commands

### Setup

```bash
make dependencies-for-development  # Install all dev dependencies (creates .venv)
make dependencies                   # Install runtime dependencies only
source .venv/bin/activate           # Activate virtual environment
```

### Lint

```bash
make lint           # Run all linters (pylint, mypy, bandit, black, flake8, isort)
make pylint         # Run pylint only
make mypy           # Run mypy
make black          # Format with black
make isort          # Sort imports
make flake8         # Run flake8
make bandit         # Security linter
```

### Test

```bash
make test           # Run pytest
pytest tests/template_python_example_test.py::test_example_function  # Single test
make coverage       # Run tests with coverage report
```

### Run

```bash
make run                    # Run with default CLI_ARGS=task1
make run CLI_ARGS="task2"   # Run specific subcommand
./template-python.py task1  # Direct execution
```

### Build

```bash
make package        # Build wheel file
make docker-build   # Build Docker image
```

## Code Style

- Python 3.10+ required
- Black formatting with 120 character line length
- Mypy type checking
- isort configured for black compatibility
- flake8 extends ignore for black compatibility (E203, E501, E704, W503)

## Architecture

- `src/template_python/` - Main package source
- `template-python.py` - CLI entry point with "command subcommand" pattern
- `tests/` - pytest test files (naming: `*_test.py`)
- `makefiles/` - OS-specific make targets (linux.mk, darwin.mk)
- `pyproject.toml` - All Python tooling configuration
- `CONFIGURATION_LOCATOR` dict in template-python.py defines config precedence
