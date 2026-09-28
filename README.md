# AVR: Auto Version & Release
A simple demo repo for automatic versioning and release of a containerized app using conventional commit analysis

## Requirements

- Repo configured to only accept squash and rebase merging
- Block PRs that don't use conventional commits in their titles
- Pushes to `main` generate a git tag along with a GitHub release and `CHANGELOG` notes
- Tags being pushed to the repo induce a versioned artifact being pushed to GHCR
