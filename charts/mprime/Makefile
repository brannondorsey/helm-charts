.PHONY: build push check-env

default: build push

build: check-env
	docker build -t brannondorsey/mprime --build-arg MPRIME_VERSION=$(MPRIME_VERSION) .
	docker tag brannondorsey/mprime brannondorsey/mprime:$(MPRIME_VERSION)

push: check-env
	docker push brannondorsey/mprime
	docker push brannondorsey/mprime:$(MPRIME_VERSION)

check-env:
ifndef MPRIME_VERSION
  # Must be in to format p95v294b8 (https://www.mersenne.org/download/#download)
	$(error The MPRIME_VERSION environment variable must be defined)
endif
