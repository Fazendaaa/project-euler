FROM r-base:4.4.1
LABEL author="fazenda"
LABEL project="project-euler-r"

RUN [ "apt", "update" ]
RUN [ "apt", "install", "--yes", "libcurl4-openssl-dev" ]

WORKDIR /usr/src/

RUN [ "R", "-e", "install.packages('renv')" ]

COPY .Rbuildignore .
COPY .lintr .
COPY NAMESPACE .
COPY DESCRIPTION .
COPY renv.lock .

RUN [ "R", "-e", "renv::install(prompt = FALSE)" ]

COPY data/ data/
COPY docs/ docs/
COPY man/ man/
COPY tests/ tests/
COPY src/ src/
COPY R/ R/
