# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script.  Two threads concurrently increment a shared counter, potentially leading to an incorrect final count due to the lack of synchronization mechanisms. The solution demonstrates how to avoid this race condition using appropriate synchronization primitives (in this case a lock file).