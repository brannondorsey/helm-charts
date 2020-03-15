# A Helm Chart Repository

This repo hosts several bespoke helm chart repositories.

- `mprime`: Donate compute to search for prime numbers via the [Great Internet Mersenne Prime Search](https://www.mersenne.org/) (GIMPS)!
- `xmrig`: Mine [Monero](https://www.getmonero.org/) via leftover K8s cluster resources

## Quickstart

To install the charts from this repo, you must first configure `helm` to use it.

```bash
# Add the repo to your local helm client's
helm repo add brannon https://helm.brannon.online
```

Once installed you can browse the available charts in the repo.

```
helm search repo brannon
NAME          	CHART VERSION	APP VERSION	DESCRIPTION
brannon/mprime	0.0.1        	p95v298b6  	Donate compute to search for prime numbers!
brannon/xmrig 	0.0.1        	5.8.2      	Deploy Monero miners in a Kubernetes cluster
```

Installing one is as simple as...

```bash
helm upgrade --install mprime brannon/mprime
```
