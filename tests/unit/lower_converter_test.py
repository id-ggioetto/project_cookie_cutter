import pytest

from example_project.data_parser.str_converter import StrConverter


@pytest.fixture
def str_converter():
    return StrConverter()


def test_str_converter(str_converter: StrConverter):
    assert str_converter.parse_data("Hello, World!") == "hello, world!"
