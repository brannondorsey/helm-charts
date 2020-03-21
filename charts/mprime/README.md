# mprime (Prime95)

[mprime] is the headless version of Prime95, the software used to search for prime numbers via the [Great Internet Mersenne Prime Search](https://www.mersenne.org/) (GIMPS).

## Installing the Chart

```bash
# Make sure you've added this repo to helm
helm repo add brannon https://helm.brannon.online
```

```bash
# Grab the default values, so you can override the default prime.txt config and
# set resource limits
wget -o mprime-value-overrides.yaml https://helm.brannon.online/charts/mprime/values.yaml

# Use your favorite editor to customize the default helm values. Specifically, you'll
# want to replace "ANONYMOUS" with your own username on mersenne.org and set some
# resource limits as mprime is very CPU hungry.
nano mprime-value-overrides.yaml

# Deploy the release using the values you just modified
helm upgrade --install mprime brannon/mprime --values mprime-value-overrides.yaml
```

## Uninstalling the chart

To uninstall/delete the `mprime` deployment:

```bash
helm delete mprime
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Generating a `prime.txt` config

`mprime` is configured via a `prime.txt` config file located in the same directory as the program itself. This file is generated the first time `mprime` is run by prompting the user to answer several questions. Because this helm chart is deployed non-interactively, it uses use a pre-configured `prime.txt` file, the value of which can be found in `primeTxtConfig` in [`values.yaml`](values.yaml).

If you'd like to generate and use your own `prime.txt` file, you may do so by following the instructions below.

```bash
# Download the existing values.yaml text file and save it as mprime-value-overrides.yaml
# You can ignore this step if you already have a YAML file that defines some overrides
# of the default mprime values.yaml file.
wget -o mprime-value-overrides.yaml https://helm.brannon.online/charts/mprime/values.yaml

# Run mprime inside a docker container to answer the questionnaire it provides
docker run --rm -it --name mprime brannondorsey/mprime

# Once you've completed the questions, open another terminal and run this to
# print the output of prime.txt to the console
docker exec -it mprime cat /prime.txt

# Replace the current value of primeTxtConfig with the output from the command above
nano mprime-value-overrides.yaml

# Be sure the container is removed, I've noticed sometimes mprime doesn't like to shutdown
# nicely
docker rm -f mprime

# Deploy the chart with your own prime.txt values in the primeTxtConfig of mprime-value-overrides.yaml
helm upgrade --install mprime brannon/mprime --values mprime-value-overrides.yaml
```

## Parameters

The following table lists the configurable parameters for this chart and their default values.

| Parameter           | Description                                                                                                                                                                                                                                                                                                                                            | Default                |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------- |
| `replicaCount`      | The number of unique mprime instances you'd like to run                                                                                                                                                                                                                                                                                                | `1`                    |
| `primeTxtConfig`    | The prime.txt configuration to use with each mprime instance. Note that you must replace the entire contents of this property, you cannot override specific values without full replacement.                                                                                                                                                           | See values.yaml        |
| `memoryMB`          | The max memory mprime will be configured to use, specified in megabytes. A higher value can improve calculation speed. This value is separate from any resource.limits.memory that is set, because it gets translated to a config field in prime.txt. This value MUST be less than any memory limits configured below or pods will receive OOM errors. | `8`                    |
| `workersPerReplica` | This configures how many unique workloads are being computed by a replica at any given time. Note that all CPU threads available will be used independent of this value, so setting this value higher won't necessarily yield faster results (e.g. 1 worker using 4 CPUs may be the same as 2 workers using 2 CPUs).                                   | `2`                    |
| `image.repository`  | The mprime Docker image                                                                                                                                                                                                                                                                                                                                | `brannondorsey/mprime` |
| `image.pullPolicy`  | Image pull policy                                                                                                                                                                                                                                                                                                                                      | `IfNotPresent`         |
| `resources`         | CPU/Memory resource requests/limits for each mprime replica. It is HIGHLY recommended that you set resource limits as mprime is CPU hungry!                                                                                                                                                                                                            | `{}`                   |
| `nodeSelector`      | Node labels for pod assignment                                                                                                                                                                                                                                                                                                                         | {}                     |
| `tolerations`       | Toleration labels for pod assignment                                                                                                                                                                                                                                                                                                                   | []                     |
| `affinity`          | Affinity settings for pod assignment                                                                                                                                                                                                                                                                                                                   | {}                     |
