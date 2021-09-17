

# OHDSI-R-BASE
A base image for OHDSI R projects

### TODO

- CRITICAL: Fix extract.sh to not delete `bin/` if a docker command fails.  Do not name non-existent or unauthorized OHDSI repos when using extract.sh -- you will lose your time and work.

### Scripts:

#### `deploy.sh`
- build and push a base image (currently tagged with localhost:5000/ohdsi-r-base)

#### `extract.sh`
- Currently if the repo is not accessible or you mistype a name you can lose your work in `bin/` (See: TODOs).

- Builds a project from a github repo and saves compiled dependenices in `extracts`.

### Usage
Suppose one needs to make/update a base image with precompiled R packages for the OHDSI/Achilles R package.
- Run: `extract.sh OHDSI/Achilles`
    - Let the project fully compile.
    - This will take some time
- Upon completion, the folder `extracts` will contain all the compiled R dependencies in `.tar.gz` format.
- Among the list of R packages *the project itself is included along with any and all other OHDSI projects that are dependenices*.  __Delete those__.
- Finally, copy the remaining (non-OHSDI) R packages into `bin`
- Run: `deploy.sh` with the newly added libraries to build a new base image.

