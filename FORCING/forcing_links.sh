#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 YEAR" >&2
    exit 2
fi

year=$1
forcing_source=${FORCING_SOURCE:-/scratch/v19/mtc599/access/jun25/work0/output}
variables=(10u 10v 2t 2d mror msdwlwrf msdwswrf msl mtpr sh)

for variable in "${variables[@]}"; do
    source_file="${forcing_source}/${variable}_${year}.nc"
    if [[ ! -r "${source_file}" ]]; then
        echo "Missing forcing file: ${source_file}" >&2
        exit 1
    fi
    ln -sfn "${source_file}" "${variable}.nc"
done

runoff_source=${RUNOFF_SOURCE:-/g/data/v19/mtc599/mom5/jra55_clim.1990/RYF.friver.1990_1991.nc}
if [[ ! -r "${runoff_source}" ]]; then
    echo "Missing runoff file: ${runoff_source}" >&2
    exit 1
fi
ln -sfn "${runoff_source}" RYF.friver.1990_1991.nc

echo "Forcing links configured for ${year} from ${forcing_source}"