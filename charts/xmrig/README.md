# XMRig Helm Chart

XMRig is a cryptocurrency miner for Monero (among other coins). This helm chart can be used to configure a basic CPU miner in association with a mining pool.

## Installing the Chart

```bash
# Make sure you've added this repo to helm
helm repo add brannon https://helm.brannon.online
```

```bash
# Replace the below values with the login and address for your pool
# WARNING: The password will be exposed as plaintext in the generated K8s deployment object
echo '
pool: xmr.pool.minergate.com:45700
email: email@example.com
password: password
' > xmrig-value-overrides.yaml

# Deploy the release using the values you just modified
helm upgrade --install xmrig brannon/xmrig --values xmrig-value-overrides.yaml
```

## Uninstalling the chart

To uninstall/delete the `xmrig` deployment:

```bash
helm delete xmrig
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Resources requirements

When operating your miners with the default `randomxMode: fast` configuration, at least ~5Gi of RAM is required to prevent OOM errors. If you don't have that much RAM to spare for each replica, you can set `randomxMode: light` which requires ~512Mi instead, at the cost of much slower mining performance.

## Parameters

The following table lists the configurable parameters for this chart and their default values.

| Parameter             | Description                                                                                                                             | Default                            |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| `replicaCount`        | The number of unique xmrig miners you'd like to run                                                                                     | `1`                                |
| `pool`                | The host and port of the mining pool used while mining                                                                                  | xmr.pool.minergate.com:45700       |
| `email`               | The email address used to login to the mining pool                                                                                      | email@example.com                  |
| `password`            | The password used to login to the mining pool                                                                                           | password                           |
| `poolDonationPercent` | The percentage of Monero earned during mining to donate back to the pool                                                                | `1`                                |
| `randomxMode`         | The `randomx-mode` used by the miner. `fast` is faster than `light`, but requires at least ~5Gi of memory.                              | fast                               |
| `image.repository`    | The xmrig Docker image                                                                                                                  | `brannondorsey/alpine-xmrig`       |
| `image.pullPolicy`    | Image pull policy                                                                                                                       | `IfNotPresent`                     |
| `resources`           | CPU/Memory resource requests/limits for each xmrig miner. It is HIGHLY recommended that you set resource limits as xmrig is CPU hungry! | 5Gi memory limit. See values.yaml. |
| `nodeSelector`        | Node labels for pod assignment                                                                                                          | {}                                 |
| `tolerations`         | Toleration labels for pod assignment                                                                                                    | []                                 |
| `affinity`            | Affinity settings for pod assignment                                                                                                    | {}                                 |
