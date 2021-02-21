import sys
import pathlib
import os
from memory_profiler import profile

app_path = os.path.join(pathlib.Path(__file__).parent.absolute(), '..', '..', 'src')
sys.path.append(app_path)

from impl1 import *

if __name__ == "__main__":

    print("Running memry profile on impl1 :")
    profile(impl1)(1000)
    print("Running memry profile on impl2 :")
    profile(impl2)(1000)
    print("Running memry profile on impl3 :")
    profile(impl3)(1000)
    