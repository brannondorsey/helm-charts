# Folding@home Helm Chart

Folding@home is a distributed computing project for performing molecular dynamics simulations of protein dynamics. This chart allows you to easily deploy Folding@home client in a K8s cluster to donate unused compute to medical research.

This chart is loosely based off of Rick Stoke's [`k8s-fah` repository](https://github.com/richstokes/k8s-fah). It supports CPU workloads only at this time.

## Installing the Chart

```bash
# Make sure you've added this repo to helm
helm repo add brannon https://helm.brannon.online
```

```bash
# "username", "team", and "passkey" values are all optional.
# Omitting them causes Folding@home to submit work anonymously.
helm upgrade --install fah1 \
  --set username="Your Username" \
  --set team="11111" \
  --set passkey="somethingsecret" \
  brannon/folding-at-home
```

## Uninstalling the chart

To uninstall/delete the `fah` deployment:

```bash
helm delete fah
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

The following table lists the configurable parameters for this chart and their default values.

| Parameter          | Description                                                                                                                                                     | Default             |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- |
| `replicaCount`     | The number of unique FAHClient instances you'd like to run                                                                                                      | `1`                 |
| `username`         | The Folding@home username you'd like to associate work with (optional)                                                                                          | `""`                |
| `team`             | The Folding@home team you'd like to associate work with (optional)                                                                                              | `""`                |
| `passkey`          | Your passkey value which can be used to prevent other donors from impersonating you (optional, this must be created ahead of time on the Folding@home website.) | `""`                |
| `image.repository` | The Folding@home Docker image                                                                                                                                   | `brannondorsey/fah` |
| `image.pullPolicy` | Image pull policy                                                                                                                                               | `IfNotPresent`      |
| `resources`        | CPU/Memory resource requests/limits for each Folding@home replica. It is HIGHLY recommended that you set resource limits as Folding@home is CPU hungry!         | `{}`                |
| `nodeSelector`     | Node labels for pod assignment                                                                                                                                  | {}                  |
| `tolerations`      | Toleration labels for pod assignment                                                                                                                            | []                  |
| `affinity`         | Affinity settings for pod assignment                                                                                                                            | {}                  |
