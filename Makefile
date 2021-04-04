all: build

GIT_BRANCH:=$(shell git branch | sed -n '/\* /s///p')
build: stack_build
	stack exec site -- $@
rebuild: stack_build
	stack exec site -- $@
watch: stack_build
	stack exec site -- $@
.PHONY: build rebuild watch

stack_build:
	stack build
.PHONY: stack_build

clean:
	rm -rf _site
	$(MAKE) -C booklet clean
.PHONY: clean
