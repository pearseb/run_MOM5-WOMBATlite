#! /bin/bash

echo Set up links to forcing files. 


#/scratch/v19/mtc599/access/jun25/work0/output/10u_1958.nc   /scratch/v19/mtc599/access/jun25/work0/output/msdwlwrf_1958.nc
#/scratch/v19/mtc599/access/jun25/work0/output/10v_1958.nc   /scratch/v19/mtc599/access/jun25/work0/output/msdwswrf_1958.nc
#/scratch/v19/mtc599/access/jun25/work0/output/2d_1958.nc    /scratch/v19/mtc599/access/jun25/work0/output/msl_1958.nc
#/scratch/v19/mtc599/access/jun25/work0/output/2t_1958.nc    /scratch/v19/mtc599/access/jun25/work0/output/mtpr_1958.nc
#/scratch/v19/mtc599/access/jun25/work0/output/mror_1958.nc  /scratch/v19/mtc599/access/jun25/work0/output/sh_1958.nc

dir0=/scratch/v19/mtc599/access/jun25/work0/output
yr0=1958

for var in 10u 10v 2t 2d mror msdwlwrf msdwswrf msl mtpr sh
do 
 echo $var
 ls -l $dir0/${var}_${yr0}.nc
 rm $var.nc
 ln -s $dir0/${var}_${yr0}.nc $var.nc
done

exit

