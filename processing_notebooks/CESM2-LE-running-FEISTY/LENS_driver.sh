#!/bin/bash -l

#PBS -N LENS_driver
#PBS -A P93300070
#PBS -l select=1:ncpus=14:mpiprocs=14:mem=120GB
#PBS -l walltime=06:00:00
#PBS -q casper
#PBS -j oe
#PBS -m abe

# Just run, e.g.,
# qsub -v "ENS_MEMBER=1301.008,START_YEAR=1867" < LENS_driver.sh
# To put this in the queue instead of running interactively

conda activate dev-feisty2

if [ "${ENS_MEMBER}" = "" ]; then
  echo 'ERROR: must provide ENS_MEMBER (qsub -v "ENS_MEMBER=YYYY.NNN" < LENS_driver.sh'
  echo '       (can also use qsub -v "ENS_MEMBER=YYYY.NNN,START_YEAR=YYYY,END_YEAR=YYYY" < LENS_driver.sh'
  exit 1
fi
if [ "${START_YEAR}" = "" ]; then
  START_YEAR=1850
fi
if [ "${END_YEAR}" = "" ]; then
  END_YEAR=2100
fi
echo "running ${ENS_MEMBER} from ${START_YEAR} to ${END_YEAR}"
mpirun -n 14 ./FEISTY_driver.CESM2-LENS.py --ensemble-member ${ENS_MEMBER} --start-year ${START_YEAR} --end-year ${END_YEAR}
