# AVR: Auto Version & Release
A simple demo repo for automatic versioning and release of a containerized app using conventional commit analysis

## Requirements
1. Repo configured to only accept squash and rebase merging
2. Block PRs that don't use conventional commits in their titles
3. Pushes to `main` generate a git tag along with a GitHub release and `CHANGELOG` notes
4. Tags being pushed to the repo induce a versioned artifact being pushed to GHCR

### Possible Solution for Req. 1
```bash
gh repo edit liatri0/avr_auto-version-and-release \
  --enable-merge-commit=false \
  --enable-squash-merge=true \
  --enable-rebase-merge=true
```
