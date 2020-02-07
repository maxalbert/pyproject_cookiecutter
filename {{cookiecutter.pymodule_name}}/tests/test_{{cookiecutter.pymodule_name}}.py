from .context import {{ cookiecutter.pymodule_name }}
from {{ cookiecutter.pymodule_name }} import __version__


def test_version():
    assert __version__.startswith("{{ cookiecutter.project_version   }}")
