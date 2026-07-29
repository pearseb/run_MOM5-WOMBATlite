#!/bin/csh
#PBS -l walltime=00:40:00
#PBS -l vmem=1gb
#PBS -l ncpus=1
#PBS -P v19
#PBS -q normal
#PBS -N obgc-merge
#PBS -wd
#

echo "Combine output from each cpu"


foreach ncfile (`/bin/ls *.nc.0000`)
 if (! -f $ncfile:r) then
  echo "Merging $ncfile:r"
  mppnccombine $ncfile:r
  if (-f $ncfile:r) then
   echo "  ...merged $ncfile:r, remove source files"
   rm $ncfile:r.0*
  endif

#Sometimes, the output will be put to a project different to the one that ran it.
#
#chgrp -P v19 ocean*.nc
#chgrp -P v19 ice*.nc


 else
  echo "Hmmm, $ncfile:r already exists, skipping merging"
  touch abort
 endif
end

exit



