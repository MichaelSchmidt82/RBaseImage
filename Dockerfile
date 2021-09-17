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

# Install remaining packages from source
COPY ./requirements.R .
RUN Rscript requirements.R

CMD [ "/bin/bash" ]

FROM base as build

RUN R -e "devtools::install_github('OHDSI/Achilles')"
RUN R -e "devtools::install_github('OHDSI/DataQualityDashboard')"
RUN R -e "devtools::install_github('OHDSI/CohortDiagnostics')"

FROM r-base as deploy

COPY --from=build /usr/local/lib/R/site-library/ /usr/local/lib/R/site-library/