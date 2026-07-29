#!/bin/bash
set -euo pipefail

# Move to directory at location of this file
repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "${repo_root}"

# define error function
errors=0
fail() {
    echo "ERROR: $*" >&2
    errors=$((errors + 1))
}

for directory in INPUT INITIAL RESTART FORCING OUTPUT; do
    [[ -d "${directory}" ]] || fail "missing directory ${directory}"
done

for file in input.nml field_table data_table diag_table run.pbs resubmit.pbs; do
    [[ -r "${file}" ]] || fail "missing or unreadable ${file}"
done

executable=${MOM_EXECUTABLE:-fms_MOM_WOMBAT.x}
[[ -x "${executable}" ]] || fail "missing or non-executable model binary ${executable}"

if [[ -d INPUT ]]; then
    while IFS= read -r -d '' link; do
        [[ -e "${link}" ]] || fail "broken INPUT link: ${link} -> $(readlink "${link}")"
    done < <(find INPUT -type l -print0)
fi

if [[ -d INITIAL ]]; then
    while IFS= read -r -d '' link; do
        [[ -e "${link}" ]] || fail "broken INITIAL link: ${link} -> $(readlink "${link}")"
    done < <(find INITIAL -type l -print0)
fi

[[ -r RESTART/coupler.res ]] || fail "RESTART/coupler.res is missing or unreadable"

if (( errors > 0 )); then
    echo "Preflight failed with ${errors} error(s)." >&2
    exit 1
fi

echo "Preflight passed."



