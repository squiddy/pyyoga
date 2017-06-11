import glob

from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

source_files = ['yoga.pyx'] + glob.glob('yoga/yoga/*.c')

setup(
    name='pyyoga',
    ext_modules=cythonize([
        Extension(
            'yoga',
            source_files
        )
    ])
)
