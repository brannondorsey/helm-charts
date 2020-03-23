
REPO_URL=https://helm.brannon.online/repo

.PHONY: default release package index lint debug deploy-default check-env-chart-name

default: release

release: package index

package: check-env-chart-name
	mkdir -p "repo/$(CHART)"
	helm package --destination "repo/$(CHART)" "charts/$(CHART)"

index: check-env-chart-name
	helm repo index --url "$(REPO_URL)/$(CHART)" --merge index.yaml "repo/$(CHART)"
	mv "repo/$(CHART)/index.yaml" index.yaml

lint:
	helm lint charts/*

debug: check-env-chart-name
	helm upgrade --install --dry-run --debug $(CHART) charts/$(CHART)

deploy-default: check-env-chart-name
	helm upgrade --install $(CHART) charts/$(CHART)

check-env-chart-name:
ifndef CHART
	$(error The CHART environment variable must be defined)
endif
