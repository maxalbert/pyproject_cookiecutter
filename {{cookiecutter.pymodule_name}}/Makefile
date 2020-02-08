PYMODULE_NAME ?= {{ cookiecutter.pymodule_name}}
PYTEST ?= poetry run pytest
PATH_TO_NOTEBOOK_TESTS ?= notebooks/
PATH_TO_UNIT_TESTS ?= tests/

all: test

test: unit-tests notebook-tests

unit-tests:
	$(PYTEST) --cov=$(PYMODULE_NAME) $(PATH_TO_UNIT_TESTS)

notebook-tests:
	$(PYTEST) --nbval --sanitize-with nbval_sanitize_file.cfg --cov=$(PYMODULE_NAME) $(PATH_TO_NOTEBOOK_TESTS)

# Build distribution tarball and wheel
dist:
	mkdir -p dist/
	python setup.py sdist bdist_wheel

.PHONY: all test notebook-tests unit-tests dist
