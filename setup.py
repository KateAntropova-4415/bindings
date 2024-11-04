from setuptools import setup, find_packages
from glob import glob

so_files = glob("sigmoid/python/sigmoid_core*.so")

setup(
    name="sigmoid",
    version="0.1",
    description="Sidmoid fuction for verctors with Python bindings",
    packages=find_packages(),
    package_data={
        "sigmoid": ["python/*.so"],
    },
)