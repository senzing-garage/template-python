# template-python development

The following instructions are useful during development.

## Prerequisites for development

:thinking: The following tasks need to be complete before proceeding.
These are "one-time tasks" which may already have been completed.

1. The following software programs need to be installed:
    1. [git](https://github.com/senzing-garage/knowledge-base/blob/main/WHATIS/git.md)
    1. [make](https://github.com/senzing-garage/knowledge-base/blob/main/WHATIS/make.md)
    1. [docker](https://github.com/senzing-garage/knowledge-base/blob/main/WHATIS/docker.md)

## Install Senzing C library

Since the Senzing library is a prerequisite, it must be installed first.

1. Verify Senzing C shared objects, configuration, and SDK header files are installed.
    1. `/opt/senzing/g2/lib`
    1. `/opt/senzing/g2/sdk/c`
    1. `/etc/opt/senzing`

1. If not installed, see [How to Install Senzing for Python Development].

## Install Git repository

1. Identify git repository.

    ```console
    export GIT_ACCOUNT=senzing-garage
    export GIT_REPOSITORY=template-python
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"

    ```

1. Using the environment variables values just set, follow
   steps in [clone-repository] to install the Git repository.

## Dependencies

1. A one-time command to install dependencies needed for `make` targets.
   Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}
    make dependencies-for-make

    ```

1. Install dependencies needed for [Python] code.
   Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}
    make dependencies

    ```

## Lint

1. Run linting.
   Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}
    make lint

    ```

## Test

1. Run tests.
   Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}
    make clean setup test

    ```

## Coverage

Create a code coverage map.

1. Run Go tests.
   Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}
    make clean setup coverage

    ```

   A web-browser will show the results of the coverage.
   The goal is to have over 80% coverage.

## Run

1. Run program.
   Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}
    make run

    ```

## Documentation

1. View documentation.
   Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}
    make clean documentation

    ```

1. If a web page doesn't appear, run the following command and paste the results into a web browser's address bar.

    ```console
    echo "file://${GIT_REPOSITORY_DIR}/docs/build/html/index.html"
    ```

## Docker

1. Use make target to run a docker images that builds RPM and DEB files.
   Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}
    make docker-build

    ```

1. Run docker container.
   Example:

    ```console
    docker run --rm senzing/template-python

    ```

## Package

1. Build the `wheel` file for distribution.
   Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}
    make package

    ```

1. Verify that `template-python` is not installed.
   Example:

    ```console
    python3 -m pip freeze | grep -e template-python -e template_python

    ```

   Nothing is returned.

1. Install directly from `wheel` file.
   Example:

    ```console
    python3 -m pip install ${GIT_REPOSITORY_DIR}/dist/*.whl

    ```

1. Verify that `template-python` is installed.
   Example:

    ```console
    python3 -m pip freeze | grep -e template-python -e template_python

    ```

    Example return:
    > template-python @ file:///home/senzing/senzing-garage.git/sz-sdk-python-abstract/dist/template_python-0.0.1-py3-none-any.whl#sha256=2a4e5218d66d5be60ee31bfad5943e6611fc921f28a4326d9594ceceae7e0ac1

1. If applicable, run the application.
   Example:

    ```console
    template_python

    ```

1. Uninstall the `template-python` python package.
   Example:

    ```console
    python3 -m pip uninstall template-python

    ```
