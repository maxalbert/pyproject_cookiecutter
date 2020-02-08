PYMODULE_NAME ?= {{ cookiecutter.pymodule_name}}
PYTEST ?= poetry run pytest
PATH_TO_NOTEBOOK_TESTS ?= notebooks/
PATH_TO_UNIT_TESTS ?= tests/

all: test

test: regular-tests notebook-tests

# Run regular tests with pytest
regular-tests:
	$(PYTEST) --cov=$(PYMODULE_NAME) $(PATH_TO_UNIT_TESTS)

# Validate jupyter notebooks using nbval
notebook-tests:
	$(PYTEST) --nbval --sanitize-with=nbval_sanitize_file.cfg --cov=$(PYMODULE_NAME) $(PATH_TO_NOTEBOOK_TESTS)

# Build documentation
docs:
	poetry run mkdocs build

# Build distribution tarball and wheel
dist:
	mkdir -p dist/
	python setup.py sdist bdist_wheel

.PHONY: all test regular-tests notebook-tests docs dist
