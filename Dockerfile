# =========================
# Build Stage
# =========================
FROM python:3.11-slim-bookworm AS build

WORKDIR /opt/CTFd

# Install build dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libffi-dev \
        libssl-dev \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && python -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

# -------------------------
# Install main requirements
# -------------------------
COPY requirements.txt /opt/CTFd/
RUN pip install --no-cache-dir -r requirements.txt

# -------------------------
# Install plugin requirements
# -------------------------
# Copy all plugins first
COPY CTFd/plugins /opt/CTFd/plugins

# Install plugin requirements if they exist
RUN set -e; \
    for f in /opt/CTFd/plugins/*/requirements.txt; do \
        if [ -f "$f" ]; then \
            pip install --no-cache-dir -r "$f"; \
        fi; \
    done || true
# -------------------------
# Copy full source code
# -------------------------
COPY . /opt/CTFd

# =========================
# Release Stage
# =========================
FROM python:3.11-slim-bookworm AS release

WORKDIR /opt/CTFd

# Install runtime dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libffi8 \
        libssl3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add non-root user
RUN useradd --no-log-init --shell /bin/bash -u 1001 ctfd \
    && mkdir -p /var/log/CTFd /var/uploads \
    && chown -R 1001:1001 /var/log/CTFd /var/uploads /opt/CTFd

# Copy application code
COPY --chown=1001:1001 . /opt/CTFd
COPY --chown=1001:1001 --from=build /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

# Ensure entrypoint script is executable
RUN chmod +x /opt/CTFd/docker-entrypoint.sh

USER 1001
EXPOSE 8000
ENTRYPOINT ["/opt/CTFd/docker-entrypoint.sh"]
