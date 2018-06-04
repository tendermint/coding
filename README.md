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
- Review the [go coding standards](https://github.com/tendermint/coding/blob/master/go/coding_standard.md). Follow them closely.
- Make some (or one) commits, in logical order and with a useful commit comment.
- Link to all relevant issues, if any.  The PR or the first issue should contain a detailed description.
- Await response from other users, maintainers, and/or colleagues.
- _Assign_ a PR to a maintainer if it is uncontroversial in its changes, has few lines of code changed, or will require minimal cognitive overhead to review. These PRs should rarely require requested changed. PRs submitted with significant changes should _request a review_ from a maintainer of that repo.
- Read the markdown files in this repo (and experiment with the scripts) for more information about coding at Tendermint.
- Don't change code, whether broken or not, without a Github issue/PR that documents the prior behavior, reason for changes, and new behavior.  Especially document all aspects of prior behavior before changing/refactoring working code.

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

## Merging a PR:

Each repository will have its own reviewers and CI requirements. Small PRs should be squashed then merged with a single "Merge pull request #XYZ: [title]" commit. Larger PRs can include multiple commits, but should squash related commits for brevity, prefix each commit with the PR number, and include the same single last merge commit with the PR title.

## Bash Scripts

Use 'strict mode':

- http://redsymbol.net/articles/unofficial-bash-strict-mode/

## Documentation

We use [Read The Docs](https://readthedocs.org/) to host - with [Sphinx](http://www.sphinx-doc.org/en/stable/) to build - our documentation. We currently have three docs streams:

* [Tendermint](https://tendermint.readthedocs.io)
* [Ethermint](https://ethermint.readthedocs.io)
* [Cosmos-SDK](https://cosmos-sdk.readthedocs.io)

Each is built from the `docs/` directory of their respective respositories. To build the docs locally, from the `docs/` directory, run `make html` and open `_build/html/index.html` in your browser.

To convert documentation in markdown (.md) to reStructuredText (.rst), [this tool](https://github.com/kgryte/markdown-to-restructuredtext) can be used.

Hyperlinks within the docs require that the `.rst` file type be changed to `.html` where applicable. For example:
`<./app-development.html>` refers to `app-development.rst` as written and checked-in to the repo. The build process converts `.rst` files to `.html`, hence this requirement.

Some docs are found in other repositories and get pulled in via the `conf.py` file. See [here](https://github.com/tendermint/tendermint/blob/88f5f21dbbf55589680d5e832647f5869f4fda1a/docs/conf.py#L174-L197) for an example.

NOTE: the docs on Read The Docs must be triggered manually (from the RTD dashboard) after a release or any update to the code.
