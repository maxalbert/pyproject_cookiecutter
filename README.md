# Quick start

1. Install `cookiecutter` (see [docs](https://cookiecutter.readthedocs.io/en/1.7.0/installation.html) for instructions).

2. Run `cookiecutter` with this template:
```
$ cookiecutter https://github.com/maxalbert/pyproject_cookiecutter
```
The first time you run this it will prompt you for a few parameter values. Change the relevant ones, or accept the defaults (by pressing Enter).

Let's say you provided the value `project_slug="foobar_project"`

3. Change into the newly created project directory and use `poetry` to install dependencies for your project.
```
$ cd foobar_project
$ poetry install
```