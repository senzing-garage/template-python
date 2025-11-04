# -----------------------------------------------------------------------------
# Stages
# -----------------------------------------------------------------------------

ARG IMAGE_FINAL=debian:13-slim@sha256:a347fd7510ee31a84387619a492ad6c8eb0af2f2682b916ff3e643eb076f925a

# -----------------------------------------------------------------------------
# Stage: builder
# -----------------------------------------------------------------------------

FROM ${IMAGE_FINAL} AS builder
ENV REFRESHED_AT=2025-09-01
LABEL Name="senzing/python-builder" \
      Maintainer="support@senzing.com" \
      Version="1.2.8"

# Run as "root" for system installation.

USER root

# Install packages via apt-get.

RUN apt-get update \
 && apt-get -y --no-install-recommends install \
      git \
      python3 \
      python3-dev \
      python3-pip \
      python3-venv \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Create and activate virtual environment.

RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

COPY . /git-repository
WORKDIR /git-repository

# Install packages via PIP.

RUN python3 -m pip install --upgrade pip \
 && python3 -m pip install . \
 && python3 -m pip install build

# Build Python wheel file.

RUN cp src/template_python/template-python.py src/template_python/main_entry.py \
 && python3 -m build \
 && python3 -m pip install dist/*.whl

# -----------------------------------------------------------------------------
# Stage: final
# -----------------------------------------------------------------------------

FROM ${IMAGE_FINAL} AS final
ENV REFRESHED_AT=2025-09-01
LABEL Name="senzing/template-python" \
      Maintainer="support@senzing.com" \
      Version="1.2.8"

HEALTHCHECK CMD ["/app/healthcheck.sh"]
USER root

# Install packages via apt-get.

RUN apt-get update \
 && apt-get -y --no-install-recommends install \
      python3 \
      python3-pip \
      python3-venv \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Copy files from repository.

COPY ./rootfs /

# Copy files from prior stage.

COPY --from=builder /app/venv /app/venv

# Run as non-root container

USER 1001

# Runtime environment variables.

ENV VIRTUAL_ENV=/app/venv
ENV PATH="/app/venv/bin:${PATH}"
ENV LD_LIBRARY_PATH=/opt/senzing/g2/lib/

# Runtime execution.

ENTRYPOINT ["template_python"]
