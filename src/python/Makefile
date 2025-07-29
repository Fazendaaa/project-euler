all: setup install

setup:
	@pyenv install 3.12.4
	@pyenv local 3.12.4

install:
	@poetry env use 3.12.4
	@poetry install

test:
	@poetry run pytest \
		-vvv \
    --memray \
    --no-header \
    --tb=native \
    --showlocals \
    --full-trace \
    tests

profiling:
	@poetry run pytest --profile-svg && \
		poetry run python -m snakeviz prof/combined.prof