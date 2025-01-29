#!/bin/bash

# This script demonstrates a race condition bug.

count=0

# Function to increment the counter
increment_count() {
  local new_count=$((count + 1))
  count=$new_count
}

# Function to print the counter
print_count() {
  echo "Count: $count"
}

# Create two threads to increment the counter simultaneously
thread1(){increment_count; print_count;}
thread2(){increment_count; print_count;}

# Run the threads concurrently
thread1 & thread2 & wait

# Expected output should be 2. Race condition may lead to a lower result. 
