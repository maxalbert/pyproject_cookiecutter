[![CircleCI](https://circleci.com/gh/{{ cookiecutter.github_username }}/{{ cookiecutter.github_project_name }}.svg?style=shield)](https://circleci.com/gh/{{ cookiecutter.github_username }}/{{ cookiecutter.github_project_name }}) [![License: MPL 2.0](https://img.shields.io/github/license/{{ cookiecutter.github_username }}/{{ cookiecutter.github_project_name }}.svg?style=flat-square)](https://opensource.org/licenses/MPL-2.0) [![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)


# {{ cookiecutter.project_name }}

{{ cookiecutter.project_short_description }}


## Installation

As a user, you can install it simply by running:
```
$ pip install {{ cookiecutter.pymodule_name }}
```

To set up a development environment, it is recommended to use [poetry](https://python-poetry.org/):
```
$ poetry install --extras "develop testing docs"
```

## Documentation

The full documentation can be found [here](https://{{ cookiecutter.github_username }}.github.io/{{ cookiecutter.github_project_name }}/).

## License

See [LICENSE](./LICENSE).
