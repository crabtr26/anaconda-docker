import os
import sys
import pytest

sys.path.insert(0, os.path.abspath("../src"))
from app import greet

def test_app():
    greeting = greet(name="Jacob")
    assert greeting == "Hello Jacob!"