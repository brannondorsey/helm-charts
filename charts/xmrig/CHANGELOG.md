# Changelog

## v0.1.0

Initial public release.

- Set default memory limit to 5Gi
- Add `RollingUpdate` release strategy with maxUnavailable and maxSurge both set to 100%
- Remove `securityContext` and `podSecurityContext` from `values.yaml`
- Add `randomxMode` parameter to `values.yaml`
- Add chart README documenting installation instructions and parameter values
- Use `apiVersion: v1` for backwards compatibility with Helm 2

## v0.0.1

Pre-release. Unstable and incomplete.
