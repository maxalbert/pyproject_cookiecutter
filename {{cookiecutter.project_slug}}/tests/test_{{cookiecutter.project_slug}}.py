from .context import {{ cookiecutter.project_slug }}
from {{ cookiecutter.project_slug }} import __version__


def test_version():
    assert __version__.startswith("{{ cookiecutter.project_version   }}")
