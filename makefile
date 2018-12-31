.PHONY: all
all: build

build: configure
	scripts/build.sh

configure: clean
	scripts/configure.sh

clean:
	find . -name "Dockerfile" | xargs rm -Rf {} \;
