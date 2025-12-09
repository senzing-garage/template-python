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

## Git Workflow

### Branch Naming

- Format: `{issue-number}-{description}` (e.g., `355-feature-name`)
- Dependabot branches: `dependabot/pip/{package-name}`
- Main branch: `main`

### Commit Messages

- Reference issues: `#<issue-number> <description>` (e.g., `#355 Fix typo`)
- Keep messages concise and descriptive

### Pull Requests

- All changes to `main` go through PRs
- PRs require contributor license agreement (ICLA/CCLA)
- Automated Claude AI review on all PRs
- Code owners: `@senzing-garage/senzing-python-developers`

## Testing Guidelines

### Conventions

- Test files: `tests/*_test.py`
- Framework: pytest 8.4.2
- Coverage target: 80%+

### Commands

```bash
make test                # Run all tests
make coverage            # Run with coverage report
pytest tests/file_test.py::test_name  # Single test
make docker-test         # Test in Docker container
```

### Writing Tests

- Place tests in `tests/` directory
- Name files `*_test.py`
- Use `assert` statements for validation
- No `conftest.py` currently - use pytest defaults

## Docker

### Building

```bash
make docker-build        # Build image: senzing/template-python
```

### Running

```bash
make docker-run          # Run interactively
make docker-test         # Run test suite in container
```

### Image Details

- Base: `debian:13-slim`
- Multi-stage build (builder + final)
- Runs as non-root user (UID 1001)
- Entry point: `template_python`
- Health check included

### Environment Variables in Container

```bash
VIRTUAL_ENV=/app/venv
LD_LIBRARY_PATH=/opt/senzing/g2/lib/
```

## CI/CD

### PR Checks (GitHub Actions)

| Check | Purpose |
|-------|---------|
| pylint, mypy, black, flake8, isort | Code quality |
| bandit | Security scanning |
| pytest-linux/darwin/windows | Cross-platform tests |
| dependency-scan | Vulnerability scanning |
| spellcheck | Spelling verification |
| docker-build-container | Docker build verification |
| claude-pr-review | AI-powered code review |

### Matrix Testing

- Python: 3.9, 3.10, 3.11, 3.12
- OS: Linux, macOS, Windows
- Senzing SDK: production-v4, staging-v4

### Releases

- Tag format: `[0-9]+.[0-9]+.[0-9]+` (semantic versioning)
- Sphinx docs auto-deploy to GitHub Pages on release

## Troubleshooting

### Environment Setup

- Requires: git, make, docker, sphinx
- Senzing library at `/opt/senzing/er/lib`
- Run `make dependencies-for-development` to set up

### Python Version Issues

- Minimum: Python 3.9
- Documentation requires Python 3.12+ (Sphinx deps won't install on older versions)

### Common Issues

| Issue | Solution |
|-------|----------|
| mypy strict failures | Add type hints to all functions |
| Virtual env not found | Run `make dependencies-for-development` |
| Docs won't build | Use Python 3.12+ |
| Docker build fails | Check Senzing libs at `/opt/senzing/g2/lib/` |

### Platform Notes

- **Linux**: Standard setup, uses `xdg-open` for docs
- **macOS**: Needs `DYLD_LIBRARY_PATH`, uses `open` for docs
- **Windows**: Different venv path (`.venv\Scripts\activate`)

## Key Dependencies

### Runtime

- `less` (0.0.1) - Minimal utility

### Development

| Package | Version | Purpose |
|---------|---------|---------|
| pytest | 8.4.2 | Testing framework |
| coverage | 7.10.7 | Code coverage |
| pylint | 3.3.9 | Code analysis |
| mypy | 1.18.2 | Type checking (strict) |
| black | 25.11.0 | Code formatting |
| flake8 | 7.3.0 | Style enforcement |
| isort | 6.1.0 | Import sorting |
| bandit | 1.8.6 | Security scanning |

### Documentation (Python 3.12+)

- sphinx, sphinx-rtd-theme, myst-parser, sphinx-autodoc-typehints

### Build

- setuptools (>=80), wheel, build, twine
