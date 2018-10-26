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

## References
* [Automatic Tools](https://masalmon.eu/2017/06/17/automatictools/)
* [Package Must Have](http://r-addict.com/2016/09/08/Package-Must-Have.html)

## Notes
### MCV
[MCV](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) is a kind of [Separation of Concerns](https://en.wikipedia.org/wiki/Separation_of_concerns), that's it in a R environment we could translate as a "package scoping", limiting what and how this package should behave with the connections that it make. 

In this case, all of the [R](./R/) source file are in the `Model` scope due to only handling only processing of the data. If someone wishes to connect to some application, like an Microsoft Excel usage, one must first link to it through a `Controller` first, making it the binding process of the caller to it. And last, but not least, the `Viewer` in this equation; the Excel must show and send all of the user requests to the others levels -- in other words, handle the I/O.

Also, using this approach, you could benefit your application through the usage of tools like:
* [Renjin](http://www.renjin.org/)
* [GraalVm](https://www.graalvm.org/docs/reference-manual/languages/r/)
* [RPython](https://rpython.readthedocs.io/en/latest/getting-started.html)

Making the most of each tool available, that's because some of them don't work 100% on the R code, but you can make them perform better where they can.

### Docker
The usage of Docker images can help you improve the "future proofing" of your package or application, creating a sandbox that is agnostic of OS, self describing and highly performative.

Besides all of this, you can make changes in a controlled development environment before pushing it to production, testing it first and making the fine tunning where is needed.

More about it [here](http://r-addict.com/2016/05/13/Docker-Motivation.html).

### Observations
Plotting must be done in the `Viewer` level any time that is available, I would advice to limit to the `Controller` at max. That's is because packages like [ggplot2](https://ggplot2.tidyverse.org/) could affect the performance, not saying that is **BAD AND YOU WILL DIE FOR USING THEM**; but think that you are interacting with R through another application that could provide to you a belt of utilities and these tools are there to assist you.

And, another thing, testing a plot is more difficult than testing only numbers, data frames or even a database transaction.

## License
MIT license presented in the [LICENSE](./LICENSE) file.
