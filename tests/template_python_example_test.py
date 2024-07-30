"""Placeholder for defining test functions."""

from template_python import example


def test_example_function() -> None:
    """Call example_function"""
    example.example_function()


def test_example_return_int() -> None:
    """Validate func return val."""
    assert example.example_return_int(3) == 3
