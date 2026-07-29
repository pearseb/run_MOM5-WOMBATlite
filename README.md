# MOM5–WOMBATlite run directory

This repository contains the run configuration for the MOM5 executable built with generic tracers and WOMBATlite.

## External dependencies

The repository does not contain the large input, forcing, restart, or executable files. The existing `INPUT/`, `INITIAL/`, `RESTART/`, and `FORCING/` entries are links to files on Gadi. A checkout is runnable only where those link targets are accessible.

Default external locations used by the run scripts:

- atmospheric forcing: `/scratch/v19/mtc599/access/jun25/work0/output`
- runoff: `/g/data/v19/mtc599/mom5/jra55_clim.1990/RYF.friver.1990_1991.nc`
- executable: `fms_MOM_WOMBAT.x.pb_20260605` in the repository root

Override these with `FORCING_SOURCE`, `RUNOFF_SOURCE`, and `MOM_EXECUTABLE` inside `resubmit.pbs` or through the submitted job environment.

## Before submission

Run from the repository root:

```bash
bash preflight.sh
```

The preflight checks required directories, configuration files, the executable, restart availability, and broken links. `resubmit.pbs` applies the two required configuration corrections before invoking the preflight:

- enables `do_generic_WOMBATlite`
- repairs the missing comma in the active `diag_table`

## Submit

```bash
qsub resubmit.pbs
```

The PBS script changes explicitly to `$PBS_O_WORKDIR`, configures forcing links for the restart year, moves restart files into `INPUT/`, and launches `run.pbs`.

Optional settings can be supplied through the job environment, for example:

```bash
qsub -v ENDYEAR=2001,MOM_EXECUTABLE=fms_MOM_WOMBAT.x.pb_20260605 resubmit.pbs
```

## Failure diagnosis

The original submitted jobs did not reach `mpirun`. They ran outside the repository, could not write an `abort` marker, and could not find the relative `FORCING/` directory. The revised scripts stop immediately with a specific missing-file or broken-link error.

A successful launch-path preflight does not prove that the WOMBATlite tracer definitions match the restart file. The first actual model run must still verify the generic-tracer package names and restart variables against the source revision used to build the executable.
