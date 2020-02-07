#!/usr/bin/env bash

set -euo pipefail

# Put the project under version control
echo "\nPutting project under version control ..."
git init
git add .
git commit -a -m "Initial commit"

# Install project dependencies (but not the project itself)
echo "\nInstalling project dependencies (in a new poetry virtual environment) ..."
poetry install --no-root

# Initialise version management
echo "\nInitialising version management using versioneer ..."
poetry run versioneer install
git add .
git commit -a -m "Initialise version management"

# Tag git repo with initial version
echo "\nTagging git repo with initial version '{{ cookiecutter.project_version }}'"
git tag {{ cookiecutter.project_version }}

echo "\nDone. All tasks completed successfully."