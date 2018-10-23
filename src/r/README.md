# Project Euler
> R implementations

![R Badge](https://img.shields.io/badge/R-8/627-orange.svg?longCache=true&style=flat-square)
[![Travis Status](https://img.shields.io/travis/Fazendaaa/project-euler.svg?style=flat-square)](https://travis-ci.org/Fazendaaa/project-euler)
[![AppVeyor](https://img.shields.io/appveyor/ci/Fazendaaa/project-euler.svg?style=flat-square)](https://ci.appveyor.com/project/Fazendaaa/project-euler)
[![CircleCI](https://img.shields.io/circleci/project/github/Fazendaaa/project-euler.svg?style=flat-square)](https://circleci.com/gh/Fazendaaa/project-euler/tree/master)
[![Coveralls Status](https://img.shields.io/coveralls/github/Fazendaaa/project-euler.svg?style=flat-square)](https://coveralls.io/github/Fazendaaa/project-euler?branch=master)
[![Codecov Status](https://img.shields.io/codecov/c/github/Fazendaaa/project-euler.svg?style=flat-square)](https://codecov.io/gh/Fazendaaa/project-euler)

R implementations of [Project Euler](projecteuler.net) exercises

## Dependencies
This package uses the following dependencies:

* [DT](https://cran.r-project.org/web/packages/DT/index.html)
* [Rcpp](https://cran.r-project.org/web/packages/rcpp/index.html)
* [covr](https://cran.r-project.org/web/packages/covr/index.html)
* [shiny](https://cran.r-project.org/web/packages/shiny/index.html)
* [lintr](https://cran.r-project.org/web/packages/lintr/index.html)
* [magick](https://cran.r-project.org/web/packages/magick/index.html)
* [pkgdown](https://cran.r-project.org/web/packages/pkgdown/index.html)
* [formatR](https://cran.r-project.org/web/packages/formatR/index.html)
* [devtools](https://cran.r-project.org/web/packages/devtools/index.html)
* [roxygen2](https://cran.r-project.org/web/packages/roxygen2/index.html)
* [assertthat](https://cran.r-project.org/web/packages/assertthat/index.html)
* [goodpractice](https://cran.r-project.org/web/packages/goodpractice/index.html)
* [hunspell](https://cran.r-project.org/web/packages/hunspell/index.html)

If you decide to run all of the pipe integration, a Docker image containing all dependencies are presented in [r-testing](https://hub.docker.com/r/fazenda/r-testing/) docker hub.

## API
This package has a website presenting all the APIs configurations and usage, followed by some examples, to build it just:
```shell
R -e "pkgdown::build_site()"
```

## Tests
To run all the [tests](./tests) just run trough:
```shell
R -e "devtools::document();devtools::test()"
```

You need to to run `devtools::document()` because of the Rcpp implementations presented in [src](./src)

The site configurations are presented in the [_pkgdown.yml](./_pkgdown.yml) file. As the keys to the [docsearch](https://community.algolia.com/docsearch/) to run the indexing presented in the search bar.

## Code
Code following the standards in presented in the [.lintr](./.lintr) file.

## CI
The Continuos Integration (CI) used in this project is supported by the following services:
* [AppVeyor](https://www.appveyor.com/)
* [CircleCI](https://circleci.com/)
* [Travis](https://travis-ci.org/)

Through docker environment, running the following "pipe" commands:
```shell
R -e "devtools::document()"
R -e "devtools::check()"
R -e "covr::package_coverage()"
R -e "options(warn=-1);goodpractice::gp('projectEuler')"
R -e "pkgdown::build_site()"
```

## Authors
* Only [me](https://github.com/Fazendaaa)

## Contributors
You can see this in the [DESCRIPTION](./DESCRIPTION) file.

## License
MIT license presented in the [LICENSE](./LICENSE) file.
