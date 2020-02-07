#!/usr/bin/env bash

set -euo pipefail

# Put the project under version control
echo ""
echo "Putting project under version control ..."
git init
git add .
git commit -a -m "Initial commit"

# Install project dependencies (but not the project itself)
echo ""
echo "Installing project dependencies (in a new poetry virtual environment) ..."
poetry install --no-root

# Initialise version management
echo ""
echo "Initialising version management using versioneer ..."
poetry run versioneer install
git add .
git commit -a -m "Initialise version management"

# Tag git repo with initial version
echo ""
echo "Tagging git repo with initial version '{{ cookiecutter.project_version }}'"
git tag -f {{ cookiecutter.project_version }}

echo ""
echo "Done. All tasks completed successfully."
