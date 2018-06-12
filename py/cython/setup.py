#!/usr/bin/python
#python version: 2.7.3
#Filename: setup.py
 
# Run as:  
#    python setup.py build_ext --inplace  
   
import sys  
#sys.path.insert(0, "..")  
   
from distutils.core import setup  
#from distutils.extension import Extension  
from Cython.Build import cythonize  
#from Cython.Distutils import build_ext
'''
if len(sys.argv) == 4:
    pyx_file = sys.argv[3]
    print pyx_file
else:
    print "No file specified!!!"
    print "Usage: python setup.py build_ext --inplace "
    exit()
'''
setup(
    ext_modules = cythonize("data_utils.pyx")
)

'''   
# ext_module = cythonize("TestOMP.pyx")  
ext_module = Extension(
                        "cpu_nms",
            ["cpu_nms.pyx"],
            extra_compile_args=["/openmp"],
            extra_link_args=["/openmp"],
            )
   
setup(
    cmdclass = {'build_ext': build_ext},
        ext_modules = [ext_module], 
)
'''
