# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut/cmake-build-release

# Include any dependencies generated for this target.
include CMakeFiles/sea-cut.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sea-cut.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sea-cut.dir/flags.make

CMakeFiles/sea-cut.dir/sea-cut.cpp.o: CMakeFiles/sea-cut.dir/flags.make
CMakeFiles/sea-cut.dir/sea-cut.cpp.o: ../sea-cut.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut/cmake-build-release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/sea-cut.dir/sea-cut.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sea-cut.dir/sea-cut.cpp.o -c /Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut/sea-cut.cpp

CMakeFiles/sea-cut.dir/sea-cut.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sea-cut.dir/sea-cut.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut/sea-cut.cpp > CMakeFiles/sea-cut.dir/sea-cut.cpp.i

CMakeFiles/sea-cut.dir/sea-cut.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sea-cut.dir/sea-cut.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut/sea-cut.cpp -o CMakeFiles/sea-cut.dir/sea-cut.cpp.s

# Object files for target sea-cut
sea__cut_OBJECTS = \
"CMakeFiles/sea-cut.dir/sea-cut.cpp.o"

# External object files for target sea-cut
sea__cut_EXTERNAL_OBJECTS =

sea-cut: CMakeFiles/sea-cut.dir/sea-cut.cpp.o
sea-cut: CMakeFiles/sea-cut.dir/build.make
sea-cut: CMakeFiles/sea-cut.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut/cmake-build-release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable sea-cut"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sea-cut.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sea-cut.dir/build: sea-cut

.PHONY : CMakeFiles/sea-cut.dir/build

CMakeFiles/sea-cut.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sea-cut.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sea-cut.dir/clean

CMakeFiles/sea-cut.dir/depend:
	cd /Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut/cmake-build-release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut /Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut /Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut/cmake-build-release /Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut/cmake-build-release /Users/MichelleWang/Desktop/ura/SeaSTL/SeaCut/cmake-build-release/CMakeFiles/sea-cut.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sea-cut.dir/depend

