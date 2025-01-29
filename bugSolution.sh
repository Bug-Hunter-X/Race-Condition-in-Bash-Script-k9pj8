#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

count=0
lock_file="count.lock"

# Function to increment the counter
increment_count() {
  # Acquire the lock
  flock $lock_file

  local new_count=$((count + 1))
  count=$new_count
  echo "Count incremented to: $count" >> count.log
  # Release the lock
  flock -u $lock_file
}

# Function to print the counter
print_count() {
  echo "Count: $count"
}

# Create two threads to increment the counter simultaneously
thread1(){increment_count;}
thread2(){increment_count;}

# Run the threads concurrently
thread1 & thread2 & wait

# Print the final count from the log
final_count=$(tail -n1 count.log | cut -d' ' -f 4)
echo "Final Count: $final_count"
rm count.lock count.log