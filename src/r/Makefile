REGISTRY_OWNER:=fazenda
PROJECT_TAG:=latest

all: interact

build:
	@docker buildx build --load --tag ${REGISTRY_OWNER}/project-euler-r:${PROJECT_TAG} .

shell: build
	@docker run \
		--rm \
		--workdir /usr/src \
		--volume $(shell pwd):/usr/src \
		-it \
		${REGISTRY_OWNER}/project-euler-r:${PROJECT_TAG} \
		/bin/sh

interact: build
	@docker run \
		--rm \
		--workdir /usr/src \
		--volume $(shell pwd):/usr/src \
		-it \
		${REGISTRY_OWNER}/project-euler-r:${PROJECT_TAG} \
		R

test:
	@docker run \
		--rm \
		${REGISTRY_OWNER}/project-euler-r:${PROJECT_TAG} \
		R -e "devtools::test()"