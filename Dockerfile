FROM r-base:3.5.1

RUN apt-get update  \
    && apt-get install git \
                       ssh \
                       apt-utils \
                       libssl-dev \
                       gfortran-8 \
                       libxml2-dev \
                       r-cran-rmysql \
                       texlive-latex-base \
                       libcurl4-openssl-dev \
                       texlive-fonts-recommended -y \
    && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c(\"DT\",\
                             \"Rcpp\",\
                             \"covr\",\
                             \"shiny\",\
                             \"lintr\",\
                             \"magick\",\
                             \"pkgdown\",\
                             \"formatR\",\
                             \"devtools\",\
                             \"roxygen2\",\
                             \"assertthat\",\
                             \"goodpractice\",\
                             \"hunspell\"), dependencies=TRUE)"

RUN adduser docker sudo

USER docker
