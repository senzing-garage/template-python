# Makefile extensions for windows.

# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

SENZING_TOOLS_DATABASE_URL ?= sqlite3://na:na@nowhere/C:\Temp\sqlite\G2C.db

# -----------------------------------------------------------------------------
# OS specific targets
# -----------------------------------------------------------------------------

.PHONY: clean-osarch-specific
clean-osarch-specific:
	@docker rm  --force $(DOCKER_CONTAINER_NAME)
	@docker rmi --force $(DOCKER_IMAGE_NAME) $(DOCKER_BUILD_IMAGE_NAME)
	del /F /S /Q  $(DIST_DIRECTORY) || true
	del /F /S /Q   $(MAKEFILE_DIRECTORY)/coverage.xml
	del /F /S /Q  $(MAKEFILE_DIRECTORY)/docs/build
	del /F /S /Q  $(MAKEFILE_DIRECTORY)/htmlcov
	del /F /S /Q $(TARGET_DIRECTORY)

.PHONY: coverage-osarch-specific
coverage-osarch-specific:
	@pytest --cov=src --cov-report=xml  $(shell git ls-files '*.py'   )
	@coverage html
	@explorer $(MAKEFILE_DIRECTORY)/htmlcov/index.html


.PHONY: hello-world-osarch-specific
hello-world-osarch-specific:
	@echo "Hello World, from windows."


.PHONY: package-osarch-specific
package-osarch-specific:
	# cp  $(MAKEFILE_DIRECTORY)/template-python.py $(MAKEFILE_DIRECTORY)/src/template_python/main_entry.py
	@python3 -m build
	# rm $(MAKEFILE_DIRECTORY)/src/template_python/main_entry.py


.PHONY: setup-osarch-specific
setup-osarch-specific:
	@echo "No setup required."


.PHONY: sphinx-osarch-specific
sphinx-osarch-specific:
	# @cd docs; rm -rf build; make html


.PHONY: view-sphinx-osarch-specific
view-sphinx-osarch-specific:
	@xdg-open file://$(MAKEFILE_DIRECTORY)/docs/build/html/index.html

# -----------------------------------------------------------------------------
# Makefile targets supported only by this platform.
# -----------------------------------------------------------------------------

.PHONY: only-windows
only-windows:
	@echo "Only windows has this Makefile target."
