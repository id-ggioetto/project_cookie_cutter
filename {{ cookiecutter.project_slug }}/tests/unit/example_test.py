import pytest

from {{ cookiecutter.project_slug }}.core.converter import Converter


@pytest.fixture
def str_converter():
    return Converter()


def test_str_converter(str_converter: Converter):
    assert str_converter.convert("Hello, World!") == "hello, world!"
