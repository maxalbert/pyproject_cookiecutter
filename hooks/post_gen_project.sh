#!/usr/bin/env bash

set -euo pipefail

# Put the project under version control
echo ""
echo "Putting project under version control ..."
git init
git config --local user.name "{{ cookiecutter.author_name }}"
git config --local user.email "{{ cookiecutter.author_email }}"
git add .
git commit -a -m "Initial commit"
git tag -f "initial_commit"

# Install project dependencies (but not the project itself yet because
# we need to initialise version management with versioneer first).
echo ""
echo "Installing project dependencies (in a new poetry virtual environment) ..."
poetry install --no-root --extras "develop testing docs deploy"

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

# Create SSH key pair (with empty passphrase) for deployment of the docs
echo ""
echo "Creating SSH deploy key pair (files will be placed in ./ssh_deploy_keys/ ) ..."
ssh-keygen -t rsa -b 4096 -m PEM -N "" -f ./ssh_deploy_keys/ssh_deploy_key
# Rename the  key files for clarity
mv ./ssh_deploy_keys/ssh_deploy_key ./ssh_deploy_keys/ssh_deploy_key_PRIVATE.txt
mv ./ssh_deploy_keys/ssh_deploy_key.pub ./ssh_deploy_keys/ssh_deploy_key_PUBLIC.txt
# Add SSH key fingerprint to CircleCI config (so that docs can be pushed to the gh-pages branch)
SSH_KEY_FINGERPRINT=$(ssh-keygen -l -E md5 -f ./ssh_deploy_keys/ssh_deploy_key_PUBLIC.txt | awk '{print $2}' | sed -e 's/^MD5://')
sed -i "" -e "s/__PLACEHOLDER_SSH_KEY_FINGERPRINT__/${SSH_KEY_FINGERPRINT}/"  ./.circleci/config.yml
git commit -a -m "Add fingerprint for ssh deploy key"

# Tag git repo with initial version
echo ""
echo "Tagging git repo with initial version '{{ cookiecutter.project_version }}'"
git tag -f {{ cookiecutter.project_version }}

# Install the project itself into the virtual environment, too
# (so that the notebook tests can pick it up, for example).
echo ""
echo "Installing {{ cookiecutter.pymodule_name }} into virtual environment"
poetry install --extras "develop testing docs deploy"

# Build documentation skeleton
echo ""
echo "Building documentation skeleton (output will be placed in site/) ..."
poetry run mkdocs build

echo ""
echo "Done. All tasks completed successfully."
