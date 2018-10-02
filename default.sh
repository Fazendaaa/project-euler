cd ./src/r/
R -e "devtools::document()"
R -e "devtools::check()"
R -e "covr::package_coverage()"
R -e "options(warn=-1);goodpractice::gp('projectEuler')"
cd ../../
