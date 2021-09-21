docker build --target build-achilles --tag localhost:5000/ohdsi-achilles .
docker push localhost:5000/ohdsi-achilles

docker build --target build-data-quality-dashboard --tag localhost:5000/ohdsi-data-quality-dashboard .
docker push localhost:5000/ohdsi-data-quality-dashboard

docker build --target build-cohort-diagnostics --tag localhost:5000/ohdsi-cohort-diagnostics .
docker push localhost:5000/ohdsi-cohort-diagnostics