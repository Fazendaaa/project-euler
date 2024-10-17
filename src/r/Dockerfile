FROM rhub/r-minimal:4.5.0
LABEL author="fazenda"
LABEL project="project-euler-r"

RUN [ "apk", "add", "--no-cache", \
  "g++", \
  "gcc", \
  "gfortran", \
  "musl-dev", \
  "curl-dev", \
  "linux-headers", \
  "libxml2-dev", \
  "openssl-dev" \
  ]

WORKDIR /usr/src/

RUN [ "R", "-e", "install.packages(c('renv', 'pak'), repos = 'https://cloud.r-project.org/')" ]

COPY .Rbuildignore .
COPY .lintr .
COPY NAMESPACE .
COPY DESCRIPTION .
COPY renv.lock .

RUN [ "R", "-e", "options(renv.config.pak.enabled = TRUE); renv::restore(prompt = FALSE)" ]

COPY data/ data/
COPY docs/ docs/
COPY man/ man/
COPY tests/ tests/
COPY src/ src/
COPY R/ R/
