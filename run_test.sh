#!/bin/bash

# Arrays for thread count (T) and array size (N)
threads=(1 2 4 8 16 32)
sizes=(1 2 4 8 16 32)

# Create a log file to store the results
echo "Threads,Size(MB),Time(s)" > performance_results.csv

# Loop over each combination of T and N
for T in "${threads[@]}"
do
  for N in "${sizes[@]}"
  do
    # Run the performance program and measure the execution time
    echo "Running with T=$T threads and N=$N MB..."
    result=$(./performance $T $N)
    
    # Extract time from the output (assuming the program reports the time)
    time=$(echo $result | grep -oP '(?<=Time:\s)\d+\.\d+')

    # Log the result (assuming the program prints the time as "Time: X")
    echo "$T,$N,$time" >> performance_results.csv   
  done
done
