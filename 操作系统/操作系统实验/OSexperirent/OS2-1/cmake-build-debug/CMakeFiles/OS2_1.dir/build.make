# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "D:\jetbrains\CLion 2020.3\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "D:\jetbrains\CLion 2020.3\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\Gdut\OSexperirent\OS2-1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\Gdut\OSexperirent\OS2-1\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/OS2_1.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/OS2_1.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/OS2_1.dir/flags.make

CMakeFiles/OS2_1.dir/main.c.obj: CMakeFiles/OS2_1.dir/flags.make
CMakeFiles/OS2_1.dir/main.c.obj: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Gdut\OSexperirent\OS2-1\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/OS2_1.dir/main.c.obj"
	D:\Mingw64\x86_64-8.1.0-release-posix-sjlj-rt_v6-rev0\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\OS2_1.dir\main.c.obj   -c D:\Gdut\OSexperirent\OS2-1\main.c

CMakeFiles/OS2_1.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/OS2_1.dir/main.c.i"
	D:\Mingw64\x86_64-8.1.0-release-posix-sjlj-rt_v6-rev0\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Gdut\OSexperirent\OS2-1\main.c > CMakeFiles\OS2_1.dir\main.c.i

CMakeFiles/OS2_1.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/OS2_1.dir/main.c.s"
	D:\Mingw64\x86_64-8.1.0-release-posix-sjlj-rt_v6-rev0\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Gdut\OSexperirent\OS2-1\main.c -o CMakeFiles\OS2_1.dir\main.c.s

# Object files for target OS2_1
OS2_1_OBJECTS = \
"CMakeFiles/OS2_1.dir/main.c.obj"

# External object files for target OS2_1
OS2_1_EXTERNAL_OBJECTS =

OS2_1.exe: CMakeFiles/OS2_1.dir/main.c.obj
OS2_1.exe: CMakeFiles/OS2_1.dir/build.make
OS2_1.exe: CMakeFiles/OS2_1.dir/linklibs.rsp
OS2_1.exe: CMakeFiles/OS2_1.dir/objects1.rsp
OS2_1.exe: CMakeFiles/OS2_1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\Gdut\OSexperirent\OS2-1\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable OS2_1.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\OS2_1.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/OS2_1.dir/build: OS2_1.exe

.PHONY : CMakeFiles/OS2_1.dir/build

CMakeFiles/OS2_1.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\OS2_1.dir\cmake_clean.cmake
.PHONY : CMakeFiles/OS2_1.dir/clean

CMakeFiles/OS2_1.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\Gdut\OSexperirent\OS2-1 D:\Gdut\OSexperirent\OS2-1 D:\Gdut\OSexperirent\OS2-1\cmake-build-debug D:\Gdut\OSexperirent\OS2-1\cmake-build-debug D:\Gdut\OSexperirent\OS2-1\cmake-build-debug\CMakeFiles\OS2_1.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/OS2_1.dir/depend

