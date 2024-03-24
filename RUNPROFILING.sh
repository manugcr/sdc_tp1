#!/bin/bash

echo ""

if [ -d "./build" ]; then
    echo ""
    echo "-> Removing old build directory..."
    rm -rf ./build/*
else
    echo "" 
    echo "-> Creating build directory..."
    mkdir ./build
fi

if [ -d "./output" ]; then
    echo ""
    echo "-> Removing old output directory..."
    rm -rf ./output/*
else
    echo "" 
    echo "-> Creating output directory..."
    mkdir ./output
fi

echo ""
echo "-> Running profiling"

# Compile the c codes and link them from ./src directory.
gcc -Wall -pg ./src/test_gprof.c ./src/test_gprof_new.c -o ./build/test

# Run the binary
echo ""
echo "-> Running the binary..."
cd build && ./test

# Run gprof 
gprof test gmon.out > ./output/analysis.txt

# Run gprof with different flags
gprof -a test gmon.out > ./output/analysis_a.txt
gprof -b test gmon.out > ./output/analysis_b.txt
gprof -p test gmon.out > ./output/analysis_p.txt

# Print the analysis
echo ""
head ./output/analysis.txt

# Create the image from the profiling with gprof2dot
echo ""
echo "-> Creating the image..."
gprof2dot ./output/analysis.txt > ./output/analysis.dot
dot -Tpng ./output/analysis.dot -o ./output/analysis.png

# Run perf
echo ""
echo "-> Running the binary from perf, might need password for SUDO commands..."
sudo perf record ./test

# Perf report
echo ""
echo "To view perf use `sudo perf report`."

