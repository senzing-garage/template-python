# template-python

If you are beginning your journey with [Senzing],
please start with [Senzing Quick Start guides].

You are in the [Senzing Garage] where projects are "tinkered" on.
Although this GitHub repository may help you understand an approach to using Senzing,
it's not considered to be "production ready" and is not considered to be part of the Senzing product.
Heck, it may not even be appropriate for your application of Senzing!

## Synopsis

This section should give 4-5 sentences on what the artifacts in this repository do.

## Overview

This section should be replaced with real "**Overview**" content after initial repository creation.

This repository (template-python) contains exemplar python scripts that can be used to start a new python project.

The
[template-python.py]
python script is a boilerplate which has the following features:

1. Conforms to [PEP-0008] python programming style guide.
    1. With exception of some lines being too long.
1. "command subcommand" command line.
1. A structured command line parser and "-help"
1. Configuration via:
    1. Command line options
    1. Environment variables
    1. Configuration file
    1. Default
1. Messages dictionary
1. Logging and Log Level support.
1. Entry / Exit log messages.
1. Docker support.

### Contents

1. [Preamble](#preamble)
    1. [Legend](#legend)
    1. [Expectations](#expectations)
1. [Demonstrate using Command Line Interface](#demonstrate-using-command-line-interface)
    1. [Prerequisites for CLI](#prerequisites-for-cli)
    1. [Download](#download)
    1. [Environment variables for CLI](#environment-variables-for-cli)
    1. [Run command](#run-command)
1. [Demonstrate using Docker](#demonstrate-using-docker)
    1. [Prerequisites for Docker](#prerequisites-for-docker)
    1. [Database support](#database-support)
    1. [External database](#external-database)
    1. [Run Docker container](#run-docker-container)
1. [Configuration](#configuration)
1. [References](#references)

## Preamble

At [Senzing],
we strive to create GitHub documentation in a
"[don't make me think]" style.
For the most part, instructions are copy and paste.
Whenever thinking is needed, it's marked with a "thinking" icon :thinking:.
Whenever customization is needed, it's marked with a "pencil" icon :pencil2:.
If the instructions are not clear, please let us know by opening a new
[Documentation issue] describing where we can improve.   
Now on with the show...

### Legend

1. :thinking: - A "thinker" icon means that a little extra thinking may be required.
   Perhaps there are some choices to be made.
   Perhaps it's an optional step.
1. :pencil2: - A "pencil" icon means that the instructions may need modification before performing.
1. :warning: - A "warning" icon means that something tricky is happening, so pay attention.

### Expectations

- **Space:** This repository and demonstration require 6 GB free disk space.
- **Time:** Budget 40 minutes to get the demonstration up-and-running, depending on CPU and network speeds.
- **Background knowledge:** This repository assumes a working knowledge of:
  - [Docker]

## Demonstrate using Command Line Interface

### Prerequisites for CLI

:thinking: The following tasks need to be complete before proceeding.
These are "one-time tasks" which may already have been completed.

1. Install system dependencies:
    1. Use `apt` based installation for Debian, Ubuntu and other
       [debain based distributions]
        1. See [apt-packages.txt] for list
    1. Use `yum` based installation for Red Hat, CentOS, openSuse and other
       [rpm based distributions].
        1. See [yum-packages.txt] for list
1. Install Python dependencies:
    1. See [requirements.txt] for list
        1. [Installation hints]
1. The following software programs need to be installed:
    1. [senzingapi]
1. :thinking: **Optional:**  Some databases need additional support.
   For other databases, this step may be skipped.
    1. **Db2:** See
       [Support Db2].
    1. **MS SQL:** See
       [Support MS SQL].
1. [Configure Senzing database]

### Download

1. Get a local copy of
   [template-python.py].
   Example:

    1. :pencil2: Specify where to download file.
       Example:

        ```console
        export SENZING_DOWNLOAD_FILE=~/template-python.py
        ```

    1. Download file.
       Example:

        ```console
        curl -X GET \
          --output ${SENZING_DOWNLOAD_FILE} \
          https://raw.githubusercontent.com/Senzing/template-python/main/template-python.py
        ```

    1. Make file executable.
       Example:

        ```console
        chmod +x ${SENZING_DOWNLOAD_FILE}
        ```

1. :thinking: **Alternative:** The entire git repository can be downloaded by following instructions at
   [Clone repository]

### Environment variables for CLI

1. :pencil2: Identify the Senzing `g2` directory.
   Example:

    ```console
    export SENZING_G2_DIR=/opt/senzing/g2
    ```

    1. Here's a simple test to see if `SENZING_G2_DIR` is correct.
       The following command should return file contents.
       Example:

        ```console
        cat ${SENZING_G2_DIR}/g2BuildVersion.json
        ```

1. Set common environment variables
   Example:

    ```console
    export PYTHONPATH=${SENZING_G2_DIR}/python
    ```

1. :thinking: Set operating system specific environment variables.
   Choose one of the options.
    1. **Option #1:** For Debian, Ubuntu, and other [debain based distributions].
       Example:

        ```console
        export LD_LIBRARY_PATH=${SENZING_G2_DIR}/lib:${SENZING_G2_DIR}/lib/debian:$LD_LIBRARY_PATH
        ```

    1. **Option #2** For Red Hat, CentOS, openSuse and other [rpm based distributions].
       Example:

        ```console
        export LD_LIBRARY_PATH=${SENZING_G2_DIR}/lib:$LD_LIBRARY_PATH
        ```

### Run command

1. Run the command.
   Example:

   ```console
   ${SENZING_DOWNLOAD_FILE} --help
   ```

1. For more examples of use, see [Examples of CLI].

## Demonstrate using Docker

### Prerequisites for Docker

:thinking: The following tasks need to be complete before proceeding.
These are "one-time tasks" which may already have been completed.

1. The following software programs need to be installed:
    1. [Docker]
1. [Install Senzing using Docker]
1. [Configure Senzing database using Docker]

### Database support

:thinking: **Optional:**  Some databases need additional support.
For other databases, these steps may be skipped.

1. **Db2:** See
   [Support Db2]
   instructions to set `SENZING_OPT_IBM_DIR_PARAMETER`.
1. **MS SQL:** See
   [Support MS SQL]
   instructions to set `SENZING_OPT_MICROSOFT_DIR_PARAMETER`.

### External database

:thinking: **Optional:**  Use if storing data in an external database.
If not specified, the internal SQLite database will be used.

1. :pencil2: Specify database.
   Example:

    ```console
    export DATABASE_PROTOCOL=postgresql
    export DATABASE_USERNAME=postgres
    export DATABASE_PASSWORD=postgres
    export DATABASE_HOST=senzing-postgresql
    export DATABASE_PORT=5432
    export DATABASE_DATABASE=G2
    ```

1. Construct Database URL.
   Example:

    ```console
    export SENZING_DATABASE_URL="${DATABASE_PROTOCOL}://${DATABASE_USERNAME}:${DATABASE_PASSWORD}@${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_DATABASE}"
    ```

1. Construct parameter for `docker run`.
   Example:

    ```console
    export SENZING_DATABASE_URL_PARAMETER="--env SENZING_DATABASE_URL=${SENZING_DATABASE_URL}"
    ```

### Run Docker container

Although the `Docker run` command looks complex,
it accounts for all of the optional variations described above.
Unset `*_PARAMETER` environment variables have no effect on the
`docker run` command and may be removed or remain.

1. Run Docker container.
   Example:

    ```console
    sudo docker run \
      --interactive \
      --rm \
      --tty \
      ${SENZING_DATABASE_URL_PARAMETER} \
      ${SENZING_OPT_IBM_DIR_PARAMETER} \
      ${SENZING_OPT_MICROSOFT_DIR_PARAMETER} \
      senzing/template
    ```

1. For more examples of use, see [Examples of Docker].

## Configuration

Configuration values specified by environment variable or command line parameter.

- **[SENZING_DATABASE_URL]**
- **[SENZING_DEBUG]**

## References

1. [Development](docs/development.md)
1. [Errors](docs/errors.md)
1. [Examples](docs/examples.md)
1. Related artifacts:
    1. [DockerHub](https://hub.docker.com/r/senzing/template-python)
    1. [Helm Chart](https://github.com/senzing-garage/charts/tree/main/charts/template-python)

[apt-packages.txt]: src/apt-packages.txt
[Clone repository]: docs/development.md#clone-repository
[Configure Senzing database]: https://github.com/senzing-garage/knowledge-base/blob/main/HOWTO/configure-senzing-database.md
[Configure Senzing database using Docker]: https://github.com/senzing-garage/knowledge-base/blob/main/HOWTO/configure-senzing-database-using-docker.md
[debain based distributions]: https://en.wikipedia.org/wiki/List_of_Linux_distributions#Debian-based
[Docker]: https://github.com/senzing-garage/knowledge-base/blob/main/WHATIS/docker.md
[Documentation issue]: https://github.com/senzing-garage/template-python/issues/new?template=documentation_request.md
[don't make me think]: https://github.com/senzing-garage/knowledge-base/blob/main/WHATIS/dont-make-me-think.md
[Examples of CLI]: docs/examples.md#examples-of-cli
[Examples of Docker]: docs/examples.md#examples-of-docker
[Install Senzing using Docker]: https://github.com/senzing-garage/knowledge-base/blob/main/HOWTO/install-senzing-using-docker.md
[Installation hints]: https://github.com/senzing-garage/knowledge-base/blob/main/HOWTO/install-python-dependencies.md
[PEP-0008]: https://github.com/senzing-garage/knowledge-base/blob/main/WHATIS/pep-0008.md
[requirements.txt]: requirements.txt
[rpm based distributions]: https://en.wikipedia.org/wiki/List_of_Linux_distributions#RPM-based
[Senzing]: https://senzing.com/
[senzingapi]: https://github.com/senzing-garage/knowledge-base/blob/main/HOWTO/install-senzing-api.md
[SENZING_DATABASE_URL]: https://github.com/senzing-garage/knowledge-base/blob/main/lists/environment-variables.md#senzing_database_url
[SENZING_DEBUG]: https://github.com/senzing-garage/knowledge-base/blob/main/lists/environment-variables.md#senzing_debug
[Senzing Garage]: https://github.com/senzing-garage
[Senzing Quick Start guides]: https://docs.senzing.com/quickstart/
[Support Db2]: https://github.com/senzing-garage/knowledge-base/blob/main/HOWTO/support-db2.md
[Support MS SQL]: https://github.com/senzing-garage/knowledge-base/blob/main/HOWTO/support-mssql.md
[template-python.py]: src/template-python.py
[yum-packages.txt]: src/yum-packages.txt
