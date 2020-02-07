## Setting up a development environment

`{{ cookiecutter.pymodule_name }}` uses [poetry](https://python-poetry.org/) for dependency management, so make sure you have it [installed](https://python-poetry.org/docs/#installation).

Next, install the necessary dependencies for {{ cookiecutter.pymodule_name }}:
```
$ poetry install --no-root
```


## Running the tests

```
$ poetry run pytest
```

Example output:
```
============================= test session starts ==============================
platform linux -- Python 3.8.1, pytest-3.10.1, py-1.8.0, pluggy-0.13.0
rootdir: /home/maxalbert/code/tohu, inifile:
collected 1 item

tests/test_{{ cookiecutter.pymodule_name }}.py .                                           [100%]

=========================== 1 passed in 0.11 seconds ===========================
```
