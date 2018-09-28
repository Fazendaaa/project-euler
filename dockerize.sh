docker build -t r-testing .    
docker tag r-testing:latest fazenda/r-testing
docker push fazenda/r-testing
