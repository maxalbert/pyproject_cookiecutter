# Overview

This cookiecutter template provides a minimal skeleton for a Python project.
It sets up the following files/folder structure and tools.

- Python project folder
- Folder for tests (tests are run using [pytest](https://docs.pytest.org/en/latest/))
- Version management using [versioneer](https://github.com/warner/python-versioneer/)
- Dependency management with `poetry` (dependencies are specified in `pyproject.toml`)
- Coverage testing using [coverage.py](https://coverage.readthedocs.io/en/coverage-5.0.3/) and [pytest-cov](https://pypi.org/project/pytest-cov/)


# Quick start

## Prerequisites

Make sure you have the following tools installed before.

- [cookiecutter](https://cookiecutter.readthedocs.io/en/1.7.0/)
- [git](https://git-scm.com/) (for version control)
- [poetry](https://poetry.eustace.io/) >= 1.0.0 (for dependency management in the newly created Python project)


## Usage

1. Run `cookiecutter` on this template.
   ```
   $ cookiecutter https://github.com/maxalbert/pyproject_cookiecutter
   ```
   The first time you run this it will prompt you for a few parameters. Tweak the relevant values, or simply accept the defaults (by pressing Enter).

2. Check the generated files and tweak the contents as needed.

   *Note:* In most cases you probably won't need to adjust the values, but double-check if you are unsure.

   Potential things to check:

   - `pyproject.toml` (Python version; list of dependencies and their versions)
   - `setup.py` (project name & description; author name & email; GitHub URL; license; classifiers; etc.)
   - Rename the test file `tests/test_<project_name>.py` and/or add additional test files.

3. Change into the newly created project directory and put it under version control.
   ```
   $ cd <project_name>

   $ git init
   $ git add .
   $ git commit -a -m "Initial commit"
   ```

4. Use `poetry` to install dependencies for your project (poetry will conveniently create a new virtual [environment](https://python-poetry.org/docs/managing-environments/) for your project).
   ```
   $ poetry install --no-root
   ```
   Note that we use the `--no-root` option so that the package itself does not get installed as a dependency

5. Initialise version management.
   ```
   $ poetry run versioneer install
   $ git add .
   $ git commit -a -m "Initialise version management"
   ```

6. Run the tests.

   *Note:* The test checks the project version. Since we are using `versioneer` for version management, we need to tag the current git version first.
   ```
   $ git tag 0.1.0  # TODO: this should happen automatically in a cookiecutter hook
   ```

   Then we can run the tests.
   ```
   $ poetry run pytest
   ```