Welcome to the coding resources repository for Tendermint. This README is intended as a guide for both for external contributors and new hires. The `CONTRIBUTING.md` of every repo should link to this repo. The files in this repo are an amalgamation from various places and any help consolidating/organizing them will be greatly appreciated.

Most production repositories should have:

- Makefile
- version bump when merge to master
- PR/ISSUE/CONTRIBUTING files/templates
- a CODEOWNERS file (in `.github`) showing who gets to do what
- a LICENSE file and adherence to that license in the source code (e.g., file headers)

Support, or "minor" repos have more flexibility in the process. Have a gander to see how they each operate.

## Submitting a PR:

- Branch from the tip of the active development branch (`develop` for major repos, `master` for minor repos.
- Review the [go coding standards](go/coding_standards.md). Follow them closely.
- Make some (or one) commits, in logical order and with a useful commit comment.
- Unless it's a typo or small fix, PRs should refer to a specific issue.
- Await response from other users, maintainers, and/or colleagues.
- _Assign_ a PR to a maintainer if it is uncontroversial in its changes, has few lines of code changed, or will require minimal cognitive overhead to review. These PRs should rarely require requested changed. PRs submitted with significant changes should _request a review_ from a maintainer of that repo.
- Read the markdown files in this repo (and experiment with the scripts) for more information about coding at Tendermint.

## Reviewing a PR:

Any and all review is welcome, even if it is asking for a clarification. Locally testing the code that is up for review is strongly suggested. Here's an easy way to `checkout` a PR in git:

Locate the section for your github remote in the `.git/config` file. It will look something like this:

```
[remote "origin"]

	fetch = +refs/heads/*:refs/remotes/origin/*

	url = git@github.com:joyent/node.git
```

Now add the line `fetch = +refs/pull/*/head:refs/remotes/origin/pr/*` to this section. Obviously, change the github url to match your project's URL. It ends up looking like this:

```
[remote "origin"]

	fetch = +refs/heads/*:refs/remotes/origin/*

	url = git@github.com:joyent/node.git

	fetch = +refs/pull/*/head:refs/remotes/origin/pr/*
```

Now fetch all the pull requests:

```
$ git fetch origin

From github.com:joyent/node

 * [new ref]         refs/pull/1000/head -> origin/pr/1000

 * [new ref]         refs/pull/1002/head -> origin/pr/1002

 * [new ref]         refs/pull/1004/head -> origin/pr/1004

 * [new ref]         refs/pull/1009/head -> origin/pr/1009

...
```

To check out a particular pull request:

```
$ git checkout pr/999

Branch pr/999 set up to track remote branch pr/999 from origin.

Switched to a new branch 'pr/999'
```
