# template-python

If you are beginning your journey with [Senzing],
please start with [Senzing Quick Start guides].

You are in the [Senzing Garage] where projects are "tinkered" on.
Although this GitHub repository may help you understand an approach to using Senzing,
it's not considered to be "production ready" and is not considered to be part of the Senzing product.
Heck, it may not even be appropriate for your application of Senzing!

## Synopsis

This section should give 1-2 sentences on what the artifacts in this repository do.

## Overview

This section should be replaced with real "**Overview**" content after initial repository creation.

This repository (template-python) contains exemplar python scripts that can be used to start a new python project.

The [template-python.py] python script is a boilerplate which has the following features:

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

## Use

### Configuration

Configuration values specified by environment variable or command line parameter.

- **[SENZING_DATABASE_URL]**
- **[SENZING_DEBUG]**

## References

1. [Development]
1. [Errors]
1. [Examples]
1. Related artifacts:
    1. [DockerHub]

[Development]: docs/development.md
[DockerHub]: https://hub.docker.com/r/senzing/template-python
[Errors]: docs/errors.md
[Examples]: docs/examples.md
[PEP-0008]: https://github.com/senzing-garage/knowledge-base/blob/main/WHATIS/pep-0008.md
[Senzing Garage]: https://github.com/senzing-garage
[Senzing Quick Start guides]: https://docs.senzing.com/quickstart/
[SENZING_DATABASE_URL]: https://github.com/senzing-garage/knowledge-base/blob/main/lists/environment-variables.md#senzing_database_url
[SENZING_DEBUG]: https://github.com/senzing-garage/knowledge-base/blob/main/lists/environment-variables.md#senzing_debug
[Senzing]: https://senzing.com/
[template-python.py]: src/template-python.py
