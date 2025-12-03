
# ===============================
# GOLDEN BASE IMAGE
# ===============================
FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04 AS base

ARG USERNAME=vscode
ARG PRODUCT
ARG ENVIRONMENT

USER root

# Core dependencies
RUN apt-get update && apt-get install -y \
        curl wget unzip git jq python3 python3-pip \
        build-essential pkg-config libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Create tool installation directory
RUN mkdir -p /opt/obsidianwall/tools

# Copy golden installers
COPY install_iac_tools.py /opt/obsidianwall/installers/install_iac_tools.py
COPY ansible/roles/install_iac_tools/ /opt/obsidianwall/ansible/iac_tools/

# ===============================
# PRODUCT LAYER (IaC / CNAPP / AI)
# ===============================

COPY extensions/${PRODUCT}/ /tmp/${PRODUCT}-layer/

RUN if [ -d "/tmp/${PRODUCT}-layer/" ]; then \
        echo "Applying PRODUCT layer: ${PRODUCT}"; \
        bash /tmp/${PRODUCT}-layer/install.sh; \
    else \
        echo "No product layer found, skipping."; \
    fi

# ===============================
# ENVIRONMENT LAYER (dev/test/staging/prod)
# ===============================

COPY environments/${ENVIRONMENT}/ /tmp/env-layer/

RUN if [ -d "/tmp/env-layer/" ]; then \
        echo "Applying ENVIRONMENT layer: ${ENVIRONMENT}"; \
        bash /tmp/env-layer/apply.sh; \
    else \
        echo "No environment layer found, skipping."; \
    fi

# Final permissions
RUN chown -R ${USERNAME}:${USERNAME} /opt/obsidianwall

USER ${USERNAME}