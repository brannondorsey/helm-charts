
REPO_URL=https://helm.brannon.online

.PHONY: default package index lint debug deploy-default check-env-chart-name

default: package index

package:
	helm package --destination repo charts/*

index:
	helm repo index --url $(REPO_URL) repo

lint:
	helm lint charts/*

debug: check-env-chart-name
	helm upgrade --install --dry-run --debug $(CHART_NAME) charts/$(CHART_NAME)

deploy-default: check-env-chart-name
	helm upgrade --install $(CHART_NAME) charts/$(CHART_NAME)

check-env-chart-name:
ifndef CHART_NAME
	$(error The CHART_NAME environment variable must be defined)
endif
