FROM rhub/r-minimal:4.5.0
LABEL author="fazenda"
LABEL project="project-euler-r"

RUN [ "apk", "add", "--no-cache", \
  "cmake", \
  "curl-dev", \
  "fontconfig-dev", \
  "fribidi-dev", \
  "freetype-dev", \
  "font-liberation", \
  "g++", \
  "gcc", \
  "gmp-dev", \
  "gfortran", \
  "harfbuzz-dev", \
  "jpeg-dev", \
  "musl-dev", \
  "libpng-dev", \
  "libgit2-dev", \
  "linux-headers", \
  "libxml2-dev", \
  "openssl-dev", \
  "pandoc-cli", \
  "tiff-dev" \
  ]

WORKDIR /usr/src/

RUN [ "R", "-e", "install.packages(c('renv', 'pak'), repos = 'https://cloud.r-project.org/')" ]

COPY renv.lock .

RUN [ "R", "-e", "options(renv.config.pak.enabled = TRUE); renv::restore(prompt = FALSE)" ]

COPY .Rbuildignore .
COPY .lintr .
COPY NAMESPACE .
COPY DESCRIPTION .

COPY inst/ inst/

WORKDIR /usr/src/inst/include/BigInt/

RUN sh -c "echo rcpp | make release"
RUN [ "mkdir", "lib" ]
RUN [ "g++", "-shared", "-fpic", "-x", "c++", "release/BigInt.hpp", "-o", "lib/BigInt.so" ]

WORKDIR /usr/src/

COPY docs/ docs/
COPY man/ man/
COPY tests/ tests/
COPY src/ src/
COPY R/ R/

# Note(Fazendaaa): until CPP's compiling issues are solved, this remains commented
# RUN [ "R", "-e", "devtools::document()" ]
# RUN [ "R", "-e", "renv::install('.')" ]