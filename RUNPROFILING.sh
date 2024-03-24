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

echo ""
echo "-> Running profiling"

# Compile the c codes and link them.
gcc -Wall -pg test_gprof.c test_gprof_new.c -o ./build/test

# Run the binary
echo "-> Running the binary..."
cd build && ./test

# Run gprof 
gprof test gmon.out > analysis.txt

# Run gprof with different flags
gprof -a test gmon.out > analysis_a.txt
gprof -b test gmon.out > analysis_b.txt
gprof -p test gmon.out > analysis_p.txt

# Print the analysis
echo ""
head analysis.txt

# Create the image from the profiling with gprof2dot
echo "-> Creating the image..."
gprof2dot analysis.txt > analysis.dot
dot -Tpng analysis.dot -o analysis.png

# Run perf
echo "-> Running the binary from perf, might need password for SUDO commands..."
sudo perf record ./test

# Perf report
echo ""
echo "To view perf use `sudo perf report`."
