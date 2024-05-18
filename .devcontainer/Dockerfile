FROM mcr.microsoft.com/devcontainers/python:3.11

ARG USERNAME='vscode'
ARG POETRY_VERSION='1.8.3'

USER ${USERNAME}

WORKDIR /app

RUN pipx install poetry==${POETRY_VERSION}

RUN pipx inject poetry poetry-plugin-export

# Uncomment these following two commands
# lines if you have already initiated
# a project with a pyproject.toml and
# poetry.lock files

# COPY ./pyproject.toml ./poetry.lock* /app/

# RUN poetry install --with dev

ENV PYTHONPATH=/app/src
