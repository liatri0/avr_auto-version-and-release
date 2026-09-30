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
  --enable-rebase-merge=true \
  --enable-squash-merge=true \
  --squash-merge-commit-message=pr-title-description
```

### Possible Solution for Req. 2
Use `wagoid/commitlint-github-action@v6` on `pull_request` events to `main`,
and turn on the following in repository settings:

- "Require a pull request before merging"
- "Require status checks to pass"

or via the CLI:
```bash
gh api -X PUT repos/OWNER/REPO/branches/main/protection --input - <<'EOF'
{
  "required_status_checks": { "strict": false, "contexts": ["commitlint"] },
  "enforce_admins": true,
  "restrictions": null,
  "required_linear_history": true
}
EOF
```
