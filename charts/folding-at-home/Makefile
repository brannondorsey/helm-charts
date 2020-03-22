FAH_VERSION=7.5.1

.PHONY: build push check-env

default: build push

build: check-env
	docker build -t brannondorsey/fah --build-arg FAH_VERSION=$(FAH_VERSION) .
	docker tag brannondorsey/fah brannondorsey/fah:$(FAH_VERSION)

push: check-env
	docker push brannondorsey/fah
	docker push brannondorsey/fah:$(FAH_VERSION)
