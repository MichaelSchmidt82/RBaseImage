FROM debian:bullseye as base

ENV DEBIAN_FRONTEND=noninteractive

#* Install common apt tools
RUN apt update -qq
RUN apt install -y gnupg apt-transport-https ca-certificates software-properties-common

#* Add CRAN repository and retrieve signing key
RUN echo 'deb https://cloud.r-project.org/bin/linux/debian bullseye-cran40/' >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key FCAE2A0E115C3D8A
RUN apt update -qq

#* Install R
RUN apt install -y r-base r-base-dev r-cran-devtools

#* Install other dependencies
RUN apt install -y default-jdk libxml2-dev libcurl4-openssl-dev libssl-dev
RUN R CMD javareconf

FROM base as test_build

#* Install the package for extraction
ARG package=missing-argument
RUN R -e "devtools::install_github('${package}')"

FROM base as deploy

WORKDIR /usr/local/lib/R/site-library/
COPY ./bin/* .
RUN for file in *; do tar xvfz ${file%}; done
RUN rm -r *.tar.gz

WORKDIR /
CMD [ "/bin/bash" ]