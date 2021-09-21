# OHDSI-RBaseImage
An image for building OHDSI's R libraries.

### Purpose:
To provide an image containing common, precompiled R packages for building OHDSI's GitHub projects.  These projects compile into R libraries.

### Files:
 - `builds.sh` is a convenience script to automate building frequently used OHDSI projects.
 - `Dockerfile` is the standard docker script for builing images.  It consists of four layers: `base`, `bulid-achilles`, `build-data-quality-dashboard`, and `build-cohort-diagnostics`.
    - `base` is the layer containing all the necessary *binaries* to compile and build an OHDSI project and their dependencies.
    - `build-*` clones and builds an OHDSI project from GitHub.  The resulting library can be included in downstream images using the `COPY --from=...` directive.
- LICENSE governs the use and redistribution of this software.
- README.md is this file.
- `requirements.R` contains all the neccesary *R lang* components for compiling OHDSI libraries.


