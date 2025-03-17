REGISTRY_OWNER:=fazenda
PROJECT_TAG:=latest

all: interact

clean:
	@sudo rm src/*.o src/*.so

build: clean
	@docker buildx build --load --tag ${REGISTRY_OWNER}/project-euler-r:${PROJECT_TAG} .

shell: clean build
	@docker run \
		--rm \
		--workdir /usr/src \
		--volume $(shell pwd):/usr/src \
		-it \
		${REGISTRY_OWNER}/project-euler-r:${PROJECT_TAG} \
		/bin/bash

interact: clean build
	@docker run \
		--rm \
		--workdir /usr/src \
		--volume $(shell pwd):/usr/src \
		-it \
		${REGISTRY_OWNER}/project-euler-r:${PROJECT_TAG} \
		R

test: clean
	@docker run \
		--rm \
		${REGISTRY_OWNER}/project-euler-r:${PROJECT_TAG} \
		R -e "devtools::test()"