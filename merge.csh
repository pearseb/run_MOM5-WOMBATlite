#!/bin/csh
#PBS -l walltime=03:40:00
#PBS -l mem=1gb
#PBS -l ncpus=1
#PBS -P v19
#PBS -q normal
#PBS -N obgc-merge
#PBS -l wd
#PBS -j oe
#PBS -lstorage=gdata/v19+scratch/v19

echo "Combine output from each cpu"

set expdir = $cwd
echo $expdir

cd OUTPUT

foreach ncfile (`/bin/ls *.nc.0000`)
 if (! -f $ncfile:r) then
  echo "Merging $ncfile:r"
  $expdir/mppnccombine $ncfile:r
  if (-f $ncfile:r) then
   echo "  ...merged $ncfile:r, remove source files"
   rm $ncfile:r.0*
  endif

#Sometimes, the output will be put to a project different to the one that ran it.
#
#chgrp -P v19 ocean*.nc
#chgrp -P v19 ice*.nc

chgrp -P v19 $ncfile:r


 else
  echo "Hmmm, $ncfile:r already exists, skipping merging"
  touch abort
 endif
end

cd $expdir

rm merge_job_waiting

exit



