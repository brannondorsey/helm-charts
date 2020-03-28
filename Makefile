
REPO_URL=https://helm.brannon.online/repo
SIGNING_KEY_NAME=Brannon Dorsey
KEY_RING=/Users/brannon/.gnupg/helm.gpg

.PHONY: default release package index lint debug deploy-default check-env-chart-name

default: release

release: package index

package: check-env-chart-name
	mkdir -p "repo/$(CHART)"
ifdef SIGNING_KEY_NAME
	# https://github.com/helm/helm/issues/2843#issuecomment-424926564
  # I had to generate another keyring (helm.gpg) with:
	# 	gpg --export-secret-keys --output ~/.gnupg/helm.gpg
	helm package --sign --key "$(SIGNING_KEY_NAME)" --keyring "$(KEY_RING)" --destination "repo/$(CHART)" "charts/$(CHART)"
else
	helm package --destination "repo/$(CHART)" "charts/$(CHART)"
endif


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
