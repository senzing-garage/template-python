ARG BASE_IMAGE=debian:11.9-slim@sha256:acc5810124f0929ab44fc7913c0ad936b074cbd3eadf094ac120190862ba36c4

# -----------------------------------------------------------------------------
# Stage: builder
# -----------------------------------------------------------------------------

FROM ${BASE_IMAGE} as builder
ENV REFRESHED_AT=2024-07-25

# Run as "root" for system installation.

USER root

# Install packages via apt-get.

RUN apt-get update \
 && apt-get -y install \
      python3 \
      python3-dev \
      python3-pip \
      python3-venv \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Create and activate virtual environment.

RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# Install packages via PIP.

COPY requirements.txt ./
RUN python3 -m pip install --upgrade pip \
 && python3 -m pip install -r requirements.txt \
 && python3 -m pip install build \
 && rm requirements.txt

# Build Python wheel file.

COPY . /git-repository
WORKDIR /git-repository
RUN cp template-python.py src/template_python/main_entry.py \
 && python3 -m build \
 && python3 -m pip install dist/*.whl

# -----------------------------------------------------------------------------
# Stage: Final
# -----------------------------------------------------------------------------

FROM ${BASE_IMAGE} AS runner

ENV REFRESHED_AT=2024-07-24

LABEL Name="senzing/template-python" \
      Maintainer="support@senzing.com" \
      Version="1.2.6"

# Define health check.

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Run as "root" for system installation.

USER root

# Install packages via apt.

RUN apt-get update \
 && apt-get -y install \
      python3 \
      python3-pip \
      python3-venv \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Copy files from repository.

COPY ./rootfs /
COPY --from=builder /app/venv /app/venv

# Activate virtual environment.

ENV VIRTUAL_ENV=/app/venv
ENV PATH="/app/venv/bin:${PATH}"

# Make non-root container.

USER 1001

# Runtime execution.

ENTRYPOINT ["template_python"]
