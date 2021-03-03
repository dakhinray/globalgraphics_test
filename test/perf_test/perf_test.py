import sys
import pathlib
import os
from memory_profiler import profile

app_path = os.path.join(pathlib.Path(__file__).parent.absolute(), '..', '..', 'src')
sys.path.append(app_path)

from impl1 import *

print("Running profile on \"impl1\" with parameter: \"1000\":")
profile(impl1)(1000)
print("Running profile on \"impl2\" with parameter: \"1000\":")
profile(impl2)(1000)
print("Running profile on \"impl3\" with parameter: \"1000\":")
profile(impl3)(1000)
    