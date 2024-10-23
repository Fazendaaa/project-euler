REGISTRY_OWNER:=fazenda
PROJECT_TAG:=latest

all: build interact

build:
	@docker buildx build --load --tag ${REGISTRY_OWNER}/project-euler-r:${PROJECT_TAG} .

interact:
	@docker run \
		--rm \
		-it \
		${REGISTRY_OWNER}/project-euler-r:${PROJECT_TAG} \
		R

test:
	@docker run ${REGISTRY_OWNER}/project-euler-r:${PROJECT_TAG} 'R -e "devtools::test()"'
