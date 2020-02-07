# Quick start

1. Install `cookiecutter` (see [docs](https://cookiecutter.readthedocs.io/en/1.7.0/installation.html) for instructions).

2. Run `cookiecutter` with this template:
```
$ cookiecutter https://github.com/maxalbert/pyproject_cookiecutter
```
The first time you run this it will prompt you for a few parameter values. Change the relevant ones, or accept the defaults (by pressing Enter).

Let's say you provided the value `project_slug="foobar_project"`

3. Check contents of the generated files and tweak as needed

In most cases you probably won't need to adjust the values, but double-check if you are unsure.

- `pyproject.toml` (Python version; list of dependencies and their versions)
- `setup.py` (project name & description; author name & email; GitHub URL; license; classifiers; etc.)


4. Change into the newly created project directory and use `poetry` to install dependencies for your project.
```
$ cd foobar_project
$ poetry install
```
