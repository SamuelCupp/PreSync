#!/bin/bash

python3 chtests.py 'carpet::use_psync=yes' 'carpet::psync_only=yes' 'carpet::psync_error=yes' Boundary2

# Test
for nprocs in 1 2; do
    ./simfactory/bin/sim create-run ptest$nprocs --walltime 1:00:00 --testsuite --procs $nprocs --num-threads 1 --ppn-used=$nprocs > pout-$nprocs.txt
done

python3 chtests.py 'carpet::use_psync=no' 'carpet::psync_only=no' 'carpet::psync_error=no' Boundary

# Test
for nprocs in 1 2; do
    ./simfactory/bin/sim create-run test$nprocs --walltime 1:00:00 --testsuite --procs $nprocs --num-threads 1 --ppn-used=$nprocs > out-$nprocs.txt
done
