#!/usr/bin/env bash

set -euo pipefail

# Put the project under version control
echo ""
echo "Putting project under version control ..."
git init
git add .
git commit -a -m "Initial commit"
git tag -f "initial_commit"

# Install project dependencies (but not the project itself)
echo ""
echo "Installing project dependencies (in a new poetry virtual environment) ..."
poetry install --no-root

# Install the git pre-commit hook for code formatting with `black`
echo ""
echo "Installing git pre-commit hook for code formatting with 'black'"
poetry run pre-commit install

# Initialise version management
echo ""
echo "Initialising version management using versioneer ..."
poetry run versioneer install
poetry run black .
git add .
git commit -a -m "Initialise version management"

# Tag git repo with initial version
echo ""
echo "Tagging git repo with initial version '{{ cookiecutter.project_version }}'"
git tag -f {{ cookiecutter.project_version }}

# Build documentation skeleton
echo ""
echo "Building documentation skeleton (output will be placed in site/) ..."
poetry run mkdocs build

echo ""
echo "Done. All tasks completed successfully."
