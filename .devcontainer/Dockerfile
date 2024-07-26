ARG APP__PYTHON_IMAGE_TAG

FROM mcr.microsoft.com/devcontainers/python:$APP__PYTHON_IMAGE_TAG

ARG APP__USERNAME
ARG APP__POETRY_VERSION

USER ${APP__USERNAME}

WORKDIR /app

RUN pipx install poetry==${APP__POETRY_VERSION}

RUN pipx inject poetry poetry-plugin-export

# Uncomment these following two commands
# lines if you have already initiated
# a project with a pyproject.toml and
# poetry.lock files

# COPY ./pyproject.toml ./poetry.lock* /app/

# RUN poetry install --with dev

ENV PYTHONPATH=/app/src
