#!/bin/sh
#PBS -A ncgd0011
#PBS -l walltime=24:00:00
#PBS -l select=1:mem=1GB
#PBS -j oe
#PBS -q casper
#PBS -N bottom_poc 

module load ncl


varname='POC_FLUX_IN'

path=/glade/campaign/cgd/cesm/CESM2-LE/timeseries/ocn/proc/tseries/month_1/$varname

echo $path

outpath=/glade/derecho/scratch/kristenk/CESM2-LE-processing/POC_flux_bottom/

for infile in `ls $path/b.e21.BHISTcmip6.f09_g17.LE2-*`
#for infile in `ls $path/b.e21.BSSP370cmip6.f09_g17.LE2-*`
do 

  filename=${infile#$path/}

  outfile=$outpath${filename%.nc}.bottom.nc

  if ! [ -f $outfile ]; then

      echo 'creating ' $outfile

      ## first, extract variable from infile
      ncks -O -v $varname $infile tmp.nc

      ## then append bottom mask that Keith prepared for me
      ncks -A /glade/work/klindsay/analysis/python/pop_bottom_mask_gx1v7_20240305.nc tmp.nc

      ## now let's extract the bottom values of the variable
      ncwa -O -a z_t -B "bottom_mask==1" -y ttl --hdr_pad 1024 tmp.nc $outfile

      ## Modify variable name in output file
      ncrename -v $varname,pocToFloor $outfile

   fi

done
