echo How many processors should I use?
read nproc

export PROMPT=no
export OMP_NUM_THREADS=1
export CCTK_TESTSUITE_RUN_PROCESSORS=1
export CCTK_TEST_SIZE=$nproc
for proc in $(seq 1 $CCTK_TEST_SIZE)
do
  export CCTK_TEST_RANK=$proc
  make sim-testsuite > test-out-$proc.txt 2>&1 &
done
for job in $(jobs -p)
do
  wait $job
done
python trim.py $CCTK_TEST_SIZE $CCTK_TESTSUITE_RUN_PROCESSORS > summary_1proc.txt

export CCTK_TESTSUITE_RUN_PROCESSORS=2
export CCTK_TEST_SIZE=($nproc / 2)
for proc in $(seq 1 $CCTK_TEST_SIZE)
do
  export CCTK_TEST_RANK=$proc
  make sim-testsuite > test-out-$proc.txt 2>&1 &
done
for job in $(jobs -p)
do
  wait $job
done
python trim.py $CCTK_TEST_SIZE $CCTK_TESTSUITE_RUN_PROCESSORS > summary_2proc.txt
