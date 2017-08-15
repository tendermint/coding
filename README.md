Welcome to the coding resources repository for Tendermint. This README is intended as a guide for both for external contributors and new hires. The `CONTRIBUTING.md` of every repo should link to this repo. The files in this repo are an amalgamation from various places and any help consolidating/organizing them will be greatly appreciated.

## Repo structure

To minimize repo bloat, strongly consider whether a new repo is required (or better yet - if a repo can be deduplicated). The "Wiki" and "Projects" features of a repo should be disabled for all repos unless usage is explicitly described in the README. We distinguish between _major_ and _minor_ repos. The former produce end-user consumable binaries (or APIs) and has the most active development. The latter are support repos for commonly used libraries and tools, etc.

### Major repo

Required:
- Makefile
- version bump when merge to master
- PR/ISSUE/CONTRIBUTING files/templates
- a MAINTAINERS file of approved reviewers/mergers

### Minor repo

Ideally:
- have "Issues" disabled (since usually few; these can be opened in a major repo)

(once the repo situation is cleaned up, we can list the repos here with more certainty)

## Submitting a PR:

First, make a fork! Add _your fork_ as a `remote`. For go reasons, always `git clone` (or `go get`) the original repo and add a remote rather than cloning your fork. Check that your fork is correct with `git remote -v`.

- Branch from the tip of the active development branch (either `develop` or `unstable` for major repos, `master` for minor repos and push to **your fork**.
- Review the [coding standards](coding/standards.md). Follow them closely.
- Make some (or one) commits, in logical order and with a useful commit comment.
- Unless it's a typo or small fix, PRs should refer to a specific issue.
- Await response from other users, maintainers, and/or colleagues.
- _Assign_ a PR to a maintainer if it is uncontroversial in its changes, has few lines of code changed, or will require minimal cognitive overhead to review. These PRs should rarely require requested changed. PRs submitted with significant changes should _request a review_ from a maintainer of that repo.
- Read the markdown files in this repo (and experiment with the scripts) for more information about coding at Tendermint.
