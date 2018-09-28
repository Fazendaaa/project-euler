FROM r-base:3.5.1

RUN apt-get update  \
    && apt-get install git libssl-dev ssh texlive-latex-base texlive-fonts-recommended libcurl4-openssl-dev libxml2-dev -y \
    && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c(\"devtools\", \"roxygen2\", \"covr\", \"shiny\", \"DT\"), dependencies=TRUE)"

RUN adduser docker sudo

USER docker

ENTRYPOINT [ "sh" ]
