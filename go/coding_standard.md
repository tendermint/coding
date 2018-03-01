# Go Coding Standard

## Required Reading

* https://golang.org/ref/spec
* https://golang.org/ref/mem
* https://golang.org/doc/effective_go.html

You must become familiar with everything above, so go get a pound of coffee.

## Coding Style

In order to keep our code looking good with lots of programmers working on it, it helps to have a "coding standard", so all the code generally looks quite similar. This doesn't mean there is only one "right way" to write code, or even that this standard is better than your style.  But if we agree to a number of stylistic practices, it makes it much easier to read and modify new code.

Please add items here, or modify them as appropriate. We have git versioning, don't be afraid of change.

### General

 * Use `gofmt` (or `goimport`) to format all code upon saving it.  (If you use VIM, check out vim-go).
 * Use a linter (see below) and generally try to keep the linter happy (where it makes sense).
 * Think about documentation, and try to leave godoc comments, when it will help new developers.
 * `TODO` should not be used in lieu of correctness.  It can be used sparingly to document future direction.
 * `BUG` / `FIXME` should be avoided; these should instead be documented as specific issues that can be linked to in the code.
 * `XXX` can be used in work-in-progress (prefixed with "WIP:" on github) branches but they must be removed before approving a PR.
 * Libraries *should* panic on developer usage error.
 * Applications (e.g. clis/servers) *should* panic on unexpected unrecoverable errors and print a stack trace.

### Comments

 * Use a space after comment deliminter (ex. `// your comment`).
 * Many comments are not sentences, these should begin with a lower case letter and end without a period.
 * The first letter of sentences in comments are capitalized and ends with a period.
 
## Github

Development should following the regimented structure for branches and pull requests outlined herein. 
For further inspiration checkout https://nvie.com/posts/a-successful-git-branching-model/.

 * Production branches
   * Production repos never push to `master` or `develop` branches directly. Push-master can merge to these branches.
   * `develop` should always pass Continuous Integration (CI), Continuous Delivery (CD) tests
   * A release is a successful PR from the `develop` to `master`. The contents
     from the PRs merged into develop forms the as basis for the release
 * Feature branches
   * should follow the naming convention `yourname/ghi-description`, where `ghi` is the github issue number
   * all branches should be in lowercase, underscores/dashes are okay in branch names
   * should have an open PR with the name "WIP: your feature description"
   * All feature PRs should be opened for merge to the `develop` branch, unless stacked on other PR leading to `develop`.
    * Ideally, for faster merges, break your PR into several PRs that stack on top of each other and lead to `develop`.
 * Reference branches
   * Sometimes it is necessary to keep a branch with reference information even there there is no intention of merging 
   * These branches should be named `yourname/reference-ghi-description`, where `ghi` is the github issue number
 * Pull Requests (PRs)
   * Do not merge PRs that aren't final -- e.g. no code dead code or code that won't be used should be committed.
   * Always delete branch immediately after merge
   * When there are to many commits, [Squash](https://stackoverflow.com/questions/5189560/squash-my-last-x-commits-together-using-git) 
   them to keep the history clean - don't do this where commits ought to be kept for future reference. 
   * All pull requests should include any relevant additions to the `CHANGELOG.md`, if the PR is opened against the 
     develop branch then include the changes under an `unreleased changes` header at the top of the document.

## Linters

These must be applied to all (go) repos.

 * [shellcheck](https://github.com/koalaman/shellcheck)
 * [gometalinter (covers all important linters)](https://github.com/alecthomas/gometalinter)
   - See the `Makefile` in each repo for ongoing linting progress. Running `make metalinter` is the ultimate goal, while `make metalinter_test` enables all the linters that are currently passing, for integration with CI.
   * gometalinter may make use of the [Tendermint fork of golint](https://github.com/tendermint/lint/)

## Documentation

Every package should have a high level `doc.go` file to describe the purpose of that package, its main functions, and any other relevant information.

## Various

 * Reserve "Save" and "Load" for long-running persistence operations. When parsing bytes, use "Encode" or "Decode".
 * Receiver variables should be at least 2 letters.  e.g. not `func (s \*Something) MyFunc(){}` but `func (sm *Something) MyFunc(){}`.  This makes refactoring easier when we rename Something to something else.
 * Maintain consistency across the codebase.
 * Do not use "instance" in function names. (JAE: what is this?)
 * A struct generally shouldn’t have a field named after itself, aka. this shouldn't occur:
``` golang
type middleware struct {
	middleware Middleware
}
```
 * In comments, use "iff" to mean, "if and only if".
 * Product names are capitalized, like "Tendermint", "Basecoin", "Protobuf", etc except in command lines: `tendermint --help`
 * Acronyms are all capitalized, like "RPC", "gRPC", "API".  "MyID", rather than "MyId".
 * Prefer errors.New() instead of fmt.Errorf() unless you're actually using the format feature with arguments. (otherwise it's needlessly inefficient, & it'll crap out on %*)

## Importing Libraries

Sometimes it's necessary to rename libraries to avoid naming collisions or ambiguity.

 * Use [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports)
 * Separate imports into blocks - one for the standard lib and one for others. In some cases, it's nice to
 separate into three: standard lib, external libs, tendermint libs.
 * Here are some common library labels for consistency:
   - dbm "github.com/tendermint/tmlibs/db"
   - cmn "github.com/tendermint/tmlibs/common"
   - tmcmd "github.com/tendermint/tendermint/cmd/tendermint/commands"
   - tmcfg "github.com/tendermint/tendermint/config/tendermint"
   - tmtypes "github.com/tendermint/tendermint/types"
 * Never use anonymous imports (the `.`), for example, `tmlibs/common` or anything else.
 * tip: Use the `_` library import to import a library for initialization effects (side effects)

## Dependencies

 * Use [dep](https://github.com/golang/dep). 
 * Never edit the Gopkg.lock file, instead if you need to lock a dependancy to a certain git hash, the `version` can
 be set to the desired hash in Gopkg.toml. For more information on advanced usage of the `Gopkg.toml` file see
[this](https://golang.github.io/dep/docs/daily-dep.html).
 * Dependencies should be pinned by a release tag, or specific commit, to avoid breaking `go get` when external dependencies are updated.

## Testing

 * The first rule of testing is: we add tests to our code
 * The second rule of testing is: we add tests to our code
 * For Golang testing:
   * Make use of table driven testing where possible and not-cumbersome
     - [Inspiration](https://dave.cheney.net/2013/06/09/writing-table-driven-tests-in-go)
   * Make use of [assert](https://godoc.org/github.com/stretchr/testify/assert) and [require](https://godoc.org/github.com/stretchr/testify/require)
 * For Bash testing:
   * Checkout [shunit2](https://github.com/kward/shunit2) and [bats](https://github.com/sstephenson/bats)
   * In general, bash testing should be kept to a minimum.

## Errors

 * Avoid [pkg/errors](https://github.com/pkg/errors), it's a [broken system](https://github.com/pkg/errors/issues/144).

## Config

 * Currently the TOML filetype is being used for config files
 * A good practice is to store the default Config file under `~/.[yourAppName]/config.toml`
 * Implement your config setup with [Viper](https://github.com/spf13/viper)

## CLI

 * When implementing a CLI use [Cobra](https://github.com/spf13/cobra) and [Viper](https://github.com/spf13/viper). urfave/cli can be replace with cobra in those repos where applicable.
 * Helper messages for commands and flags must be all lowercase.
 * Instead of using pointer flags (eg. `FlagSet().StringVar`) use viper to retrieve flag values (eg. `viper.GetString`)
   - The flag key used when setting and getting the flag should always be stored in a
   variable taking the form `FlagXxx` or `flagXxx`.
   - Flag short variable descriptions should always start with a lower case charater as to remain consistent with
   the description provided in the default `--help` flag.

## Version

 * Every repo should have a version/version.go file that mimicks the tendermint core repo
 * We read the value of the constant version in our build scripts and hence it has to be a string

## Non-Golang Code

 * All non-go code (`*.proto`, `Makefile`, `*.sh`), where there is no common
   agreement on style, should be formatted according to
   [EditorConfig](http://editorconfig.org/) config:

   ```
   # top-most EditorConfig file
   root = true

   # Unix-style newlines with a newline ending every file
   [*]
   charset = utf-8
   end_of_line = lf
   insert_final_newline = true
   trim_trailing_whitespace = true

   [Makefile]
   indent_style = tab

   [*.sh]
   indent_style = tab

   [*.proto]
   indent_style = space
   indent_size = 2
   ```

   Make sure the file above (`.editorconfig`) are in the root directory of your
   repo and you have a [plugin for your
   editor](http://editorconfig.org/#download) installed.
