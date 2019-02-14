export PROMPT=no
export CCTK_TESTSUITE_RUN_PROCESSORS=2
export CCTK_TEST_SIZE=4
for proc in $(seq 1 $CCTK_TEST_SIZE)
do
  export CCTK_TEST_RANK=$proc
  make sim-testsuite > test-out-$proc.txt 2>&1 &
done
for job in $(jobs -p)
do
  wait $job
done
for proc in $(seq 1 $CCTK_TEST_SIZE)
do
  echo "PROC $proc"
  grep 'Number failed'  test-out-$proc.txt
done
