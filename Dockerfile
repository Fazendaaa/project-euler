FROM r-base:3.5.1

# common system
RUN apt-get update
RUN apt-get install git \
                    ssh \
                    apt-utils \
                    libpq-dev \
                    libssl-dev \
                    gfortran-8 \
                    libxml2-dev \
                    r-cran-rmysql \
                    libpoppler-cpp-dev \
                    texlive-latex-base \
                    libcurl4-openssl-dev \
                    texlive-fonts-recommended -y
RUN rm -rf /var/lib/apt/lists/*

# DT package system dependencies
RUN apt-get update \
    && apt-get install r-cran-rcpp -y

# magick package system dependencies
RUN apt-get update \
    && apt-get install libmagick++-dev \
                       libtesseract-dev \
                       libleptonica-dev -y

# install packages
RUN R -e "install.packages('DT', dependencies=TRUE)"
RUN R -e "install.packages('Rcpp', dependencies=TRUE)"
RUN R -e "install.packages('rJava', dependencies=TRUE)"
RUN R -e "install.packages('xlsx', dependencies=TRUE)"
RUN R -e "install.packages('covr', dependencies=TRUE)"
RUN R -e "install.packages('dplyr', dependencies=TRUE)"
RUN R -e "install.packages('readr', dependencies=TRUE)"
RUN R -e "install.packages('shiny', dependencies=TRUE)"
RUN R -e "install.packages('lintr', dependencies=TRUE)"
RUN R -e "install.packages('magick', dependencies=TRUE)"
RUN R -e "install.packages('pkgdown', dependencies=TRUE)"
RUN R -e "install.packages('formatR', dependencies=TRUE)"
RUN R -e "install.packages('devtools', dependencies=TRUE)"
RUN R -e "install.packages('roxygen2', dependencies=TRUE)"
RUN R -e "install.packages('goodpractice', dependencies=TRUE)"
RUN R -e "install.packages('hunspell', dependencies=TRUE)"
RUN R -e "devtools::install_github('hadley/assertthat')"
RUN R -e "devtools::install_github('MangoTheCat/visualTest')"

RUN adduser docker sudo

USER docker
