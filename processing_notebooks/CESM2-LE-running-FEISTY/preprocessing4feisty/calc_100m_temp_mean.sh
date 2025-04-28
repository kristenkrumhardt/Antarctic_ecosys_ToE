#!/bin/sh
#PBS -A ncgd0011
#PBS -l walltime=12:00:00
#PBS -l select=1:ncpus=1
#PBS -q casper
#PBS -j oe
#PBS -N 100m_mean 

module load ncl


varname='TEMP'

path=/glade/campaign/cgd/cesm/CESM2-LE/timeseries/ocn/proc/tseries/month_1/$varname

echo $path

outpath=/glade/derecho/scratch/kristenk/CESM2-LE-processing/TEMP_100m/

#for file in `ls $path/b.e21.BHISTcmip6.f09_g17.LE2-*`
for file in `ls $path/b.e21.BSSP370cmip6.f09_g17.LE2-*`
do 

   infile=$file
   #echo $infile

   filename=${file#$path/}

   #echo $filename

   outfile=$outpath${filename%.nc}.100m_mean.nc

   echo $outfile

   ncwa -O -a z_t -d z_t,0,9 -v TEMP $infile $outfile

done
