

# OHDSI-R-BASE
A base image for OHDSI R projects

### TODO

- CRITICAL: Fix extract.sh to not delete `bin/` if a docker command fails.  Do not name non-existent or unauthorized OHDSI repos.

### Usages:

#### `deploy.sh`
- build and push a base image (currently tagged with localhost:5000/ohdsi-r-base)

#### `extract.sh`
- Builds a project from a github repo and saves compiled dependenices in `extracts`.  Currently if the repo is not accessible or you mistype a name you can lose your work in `bin/` (See: TODOs).
