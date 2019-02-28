#!/bin/bash

#compile ustl library
cd ./ustl/
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
  #USTL
  #clang++ examples/exustl.cpp -I ./ustl/build/include/ -L ./ustl/build/lib/ -Wl,-rpath,./ustl/build/lib -lustl -o exustl -std=c++11 -v

  #mySTL
  clang++ examples/exustl.cpp -I ./customSTL/ -o exustl -v -std=c++11
else
  # clang++ examples/exustl.cpp -I ./ustl/build/include/ -L ./ustl/build/lib/ -Wl,-rpath,./ustl/build/lib -lustl -o exustl -v
  clang++ examples/exustl.cpp -I ./customSTL/ -o exustl -v
fi


# Command for CASS
# clang++ -g -std=c++11 -fexceptions -Wall -Wextra -Wswitch-default -Wshadow -Wnon-virtual-dtor -I../src/Flight_Software/library -I../src/Flight_Software/flight_algorithms  -I../src/Utilities/CASS_DDSim/sim_support ../src/Flight_Software/library/*.cpp ../src/Flight_Software/flight_algorithms/*.cpp ../src/Utilities/CASS_DDSim/sim_support/*.cpp ../src/Utilities/CASS_DDSim/CASS_DDSim.cpp -I ../../mySTL/ -o out
