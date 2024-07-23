# Makefile extensions for linux.

# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

LD_LIBRARY_PATH ?= /opt/senzing/g2/lib
SENZING_TOOLS_DATABASE_URL ?= sqlite3://na:na@nowhere/tmp/sqlite/G2C.db
PATH := $(MAKEFILE_DIRECTORY)/bin:$(PATH)

# -----------------------------------------------------------------------------
# OS specific targets
# -----------------------------------------------------------------------------

.PHONY: clean-osarch-specific
clean-osarch-specific:
	@docker rm  --force $(DOCKER_CONTAINER_NAME) 2> /dev/null || true
	@docker rmi --force $(DOCKER_IMAGE_NAME) $(DOCKER_BUILD_IMAGE_NAME) 2> /dev/null || true
	@rm -fr $(TARGET_DIRECTORY) || true


.PHONY: hello-world-osarch-specific
hello-world-osarch-specific:
	@echo "Hello World, from linux."


.PHONY: setup-osarch-specific
setup-osarch-specific:
	@echo "No setup required."

# -----------------------------------------------------------------------------
# Makefile targets supported only by this platform.
# -----------------------------------------------------------------------------

.PHONY: only-linux
only-linux:
	@echo "Only linux has this Makefile target."
