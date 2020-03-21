# Changelog

## v0.2.0

Adds more configuration values.

- Add `workersPerReplica` to `values.yaml` to set `WorkerThreads` in the `local.txt` generated for each mprime replica.
- Add `memoryMB` to `values.yaml` to set max memory via the `Memory` config in the `local.txt` generated for each mprime replica.

## v0.1.0

Bug fixes.

- Fix `V5UserID="ANONYMOUS "` invalid user id due to ini `# comments` at end of line in `prime.txt`.
- Set default `DaysOfWork` to 1 instead of 3 in default `prime.txt`

## v0.1.0

Initial public release.

- Default release uses ANONYMOUS GIMPS username
- Default release attempts Trial Factoring task
- Add chart README documenting installation instructions and parameter values
- Use `apiVersion: v1` for backwards compatibility with Helm 2

## v0.0.1

Pre-release. Unstable and incomplete.
