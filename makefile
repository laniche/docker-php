configure:
	scripts/configure.sh

build: configure
	scripts/build.sh

all: build

.PHONY: all