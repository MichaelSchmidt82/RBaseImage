#!/bin/bash
docker build --target deploy --tag localhost:5000/ohdsi-r-base .
docker push localhost:5000/ohdsi-r-base