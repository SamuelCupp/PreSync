#!/bin/bash

# Test
for nprocs in 1 2; do
    ./simfactory/bin/sim create-run test$nprocs --walltime 1:00:00 --testsuite --procs $nprocs --num-threads 1 --ppn-used=$nprocs > out-$nprocs.txt
done
