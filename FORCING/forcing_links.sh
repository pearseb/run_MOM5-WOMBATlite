#!/bin/bash
set -euo pipefail

# Ensure that only one command line argument is given (the year)
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 YEAR" >&2
    exit 2
fi

#/scratch/v19/mtc599/access/jun25/work0/output/10u_1958.nc   /scratch/v19/mtc599/access/jun25/work0/output/msdwlwrf_1958.nc
#/scratch/v19/mtc599/access/jun25/work0/output/10v_1958.nc   /scratch/v19/mtc599/access/jun25/work0/output/msdwswrf_1958.nc
#/scratch/v19/mtc599/access/jun25/work0/output/2d_1958.nc    /scratch/v19/mtc599/access/jun25/work0/output/msl_1958.nc
#/scratch/v19/mtc599/access/jun25/work0/output/2t_1958.nc    /scratch/v19/mtc599/access/jun25/work0/output/mtpr_1958.nc
#/scratch/v19/mtc599/access/jun25/work0/output/mror_1958.nc  /scratch/v19/mtc599/access/jun25/work0/output/sh_1958.nc

forcing_source=${FORCING_SOURCE:-/scratch/v19/mtc599/access/jun25/work0/output}
year=$1
variables=(10u 10v 2t 2d mror msdwlwrf msdwswrf msl mtpr sh)

for var in "${variables[@]}"; do
  source_file="${forcing_source}/${var}_${year}.nc"
  if [[ ! -r "${source_file}" ]]; then
      echo "Missing forcing file: ${source_file}" >&2
      exit 1
  fi
  ln -sfn "${source_file}" "${var}.nc"
done

runoff_source=${RUNOFF_SOURCE:-/g/data/v19/mtc599/mom5/jra55_clim.1990/RYF.friver.1990_1991.nc}
if [[ ! -r "${runoff_source}" ]]; then
    echo "Missing runoff file: ${runoff_source}" >&2
    exit 1
fi
ln -sfn "${runoff_source}" RYF.friver.1990_1991.nc

echo "Forcing links configured for ${year} from ${forcing_source}"

exit

