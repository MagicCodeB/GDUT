cmake_minimum_required(VERSION 3.17)
project(BST C)

set(CMAKE_C_STANDARD 11)

include_directories(.)

add_executable(BST
        BST.c
        BST.h
        main.c)
