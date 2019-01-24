#!/bin/bash

#compile ustl library
cd ./stl/
make clean && rm -rf build && ./configure --prefix=build && make install

# Create a vector file
vector="#include <ustl/uvector.h>
namespace std {using namespace ustl;}"
echo "$vector" > build/include/vector

#Example
cd ../
echo "$1"
if [ "$1" = "-c++11" ]
then
  clang++ exustl.cpp -I ./stl/build/include/ -L ./stl/build/lib/ -Wl,-rpath,/home/shvamath/Desktop/code/github/SeaSTL/stl/build/lib -lustl -o ex -std=c++11 -v
else
  clang++ exustl.cpp -I ./stl/build/include/ -L ./stl/build/lib/ -Wl,-rpath,/home/shvamath/Desktop/code/github/SeaSTL/stl/build/lib -lustl -o ex -v

fi
