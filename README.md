# A Helm Chart Repository

This repo hosts several helm charts for distributed computing projects made available via one helm repository.

- [`folding-at-home`](charts/folding-at-home): Donate compute for medical research through the [Folding@home](https://foldingathome.org/) project and help cure diseases
- [`mprime`](charts/mprime): Donate compute to search for prime numbers via the [Great Internet Mersenne Prime Search](https://www.mersenne.org/) (GIMPS)!
- [`xmrig`](charts/xmrig): Mine [Monero](https://www.getmonero.org/) via leftover K8s cluster resources.

## Quickstart

To install the charts from this repo, you must first configure `helm` to use it.

```bash
# Add the repo to your local helm client's
helm repo add brannon https://helm.brannon.online
```

Once installed you can browse the available charts in the repo.

```
helm search repo brannon
NAME                   	CHART VERSION	APP VERSION	DESCRIPTION
brannon/folding-at-home	0.1.0        	7.5.1      	Donate compute for medical research and help cu...
brannon/mprime         	0.2.0        	p95v298b6  	Donate compute to search for prime numbers!
brannon/xmrig          	0.1.0        	5.8.2      	Deploy Monero miners in a Kubernetes cluster
```

Installing one is as simple as...

```bash
helm upgrade --install mprime brannon/mprime
```

## Going Further

Each chart has its own README and CHANGELOG with information specific to its installation. For instance, the mprime chart's instructions can be found in [`charts/mprime/README.md`](charts/mprime/README.md).

## Maintenance

This chart repository is maintained by Brannon Dorsey. For questions or suggestions, please open an issue instead of emailing me directly. PRs welcome 😸.

## Integrity

All charts hosted in this repository are signed by [my PGP key: `607390646A4291D3`](https://keybase.io/brannondorsey/). You can verify packages are authentic while installing them by following the instructions below.

```bash
# Add my public key to your GPG keyring
curl https://keybase.io/brannondorsey/pgp_keys.asc | gpg --import

# You may also need to provide the --keyring /path/to/pubring.gpg if you're public keyring
# is stored in a different location. If this fails, check out the link below as the gpg key
# format may have changed:
# https://github.com/helm/helm/issues/2843#issuecomment-424926564
helm upgrade --install --verify mprime brannon/mprime
```

View the [Helm Provenance and Integrity](https://helm.sh/docs/topics/provenance/) docs for more info.

## Dev

New charts versions are released by bumping the chart version in `charts/mychart/Chart.yaml` and then running:

```bash
make release CHART=mychart
```

This will package the chart inside `repo/mychart/mychart-VERSION.tgz` and add the an entry to `index.yaml`. New commits pushed to the `master` branch are immediately released to https://helm.brannon.online and made available to the public via GH Pages.
