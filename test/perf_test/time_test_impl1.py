import sys
import pathlib
import os

app_path = os.path.join(pathlib.Path(__file__).parent.absolute(), '..', '..', 'src')
sys.path.append(app_path)

from impl1 import *

impl1(50000)
