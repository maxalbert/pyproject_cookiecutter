from .context import {{ cookiecutter.pymodule_name }}
from {{ cookiecutter.pymodule_name }} import dummy_function


def test_dummy_function():
    assert 4 == dummy_function(2)
    assert 9 == dummy_function(3)
    assert 16 == dummy_function(4)
