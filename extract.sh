#!/bin/bash
docker build \
    --target test_build \
    --tag r-extract \
    --build-arg package=$1 .

docker run \
    --name some-extract r-extract

docker cp some-extract:/usr/local/lib/R/site-library .

# TODO if the above fails, this gets really messy (i.e you mistype a repo)

pushd site-library
for file in *; do
    tar cvfz ${file%.*}.tar.gz $file;
done

rm -r */
mv *.tar.gz ../extracts/
popd

rm -rf site-library
docker rm some-extract
docker image rm r-extract
