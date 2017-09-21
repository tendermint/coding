# Tendermint Coding Standard (WIP)

In order to keep our code looking good with lots of programmers working on it, it helps to have a "coding standard", so all the code generally looks quite similar. This doesn't mean there is only one "right way" to write code, or even that this standard is better than your style.  But if we agree to a number of stylistic practices, it makes it much easier to read and modify new code.

**Current state**: First proposal - try it out, give feedback, and *please* modify it

Really - please add items here, or modify them if you don't like them.  We have git versioning, don't be afraid of change.

 1. Use `gofmt` (or `goimport`) to format all code upon saving it
 2. Use a linter (see below) and generally try to keep the linter happy (where it makes sense)
 3. Think about documentation, and try to leave godoc comments, when it will help new developers. What do you think of the current documentation for [go-merkle](https://godoc.org/github.com/tendermint/go-merkle), [abci](https://godoc.org/github.com/tendermint/abci), and [tendermint](https://godoc.org/github.com/tendermint/tendermint)?

## Git

 * On Tendermint production repos never push to `master` or `develop` branches
 * New features should be written in new branches and pull request opened to the `develop` branch
 * Once in a while Bucky will push from `develop` to `master` during releases
 * All branches should be in lowercase, underscores are okay in branch names
 * All pull requests should include any relevant additions to the `CHANGELOG.md`, If PR is to the develop branch changes 
 can be included under a an `unreleased changes` header at the top of the document

## Linters

 * [lint](https://github.com/golang/lint) *required*
 * [gometalinter (all other linters)](https://github.com/alecthomas/gometalinter) *optional*
   - Anton, can you please add a sample configuration for gometalinter that we could use?  Maybe we add this to tendermint repo if we want to agree on some stylistic conventions
   - To suppress linting place the `//nolint` above a package, function, group, etc.
 * [shellcheck](https://github.com/koalaman/shellcheck) *required*

## Various

 * Reserve "Save" and "Load" for long-running persistence operations.  When parsing bytes, use "Read" or "Write".
 * Avoid single letter variable names, be more descriptive, and try to maintain consistency across the codebase.
   - JAE: This conflicts with https://talks.golang.org/2014/names.slide#7
 * Do not use "instance" in function names
 * A struct generally shouldn’t have a field named after itself, aka. this shouldn't occur: 
``` golang
type middleware struct { 
middleware Middleware 
}
```
 * In comments, use "iff" to mean, "if and only if".  (It's not a typo)
 * Product names are capitalized, like "Tendermint", "Basecoin", "Protobuf", etc except in command lines: `tendermint --help`
 * The first letter of sentences in comments are capitalized
 * Acronyms are all capitalized, like "RPC", "gRPC", "API".  "MyID", rather than "MyId"

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
 * Avoid using the `.` library import for `tmlibs/common` or anything else. The `.` import is being replaced throughout tendermint libraries
 * tip: Use the `_` library import to import a library for initialization effects (side effects) 

## Dependencies

 * Use [glide](https://github.com/Masterminds/glide) 
 * Never edit the glide.lock file, instead if you need to lock a dependancy to a certain git hash, the `version` can
 be set to the desired hash. For more information on advanced usage of the `glide.yaml` file see 
[this](https://glide.readthedocs.io/en/latest/glide.yaml/)

## Testing

 * The first rule of testing is: we add tests to our code
 * The second rule of testing is: we add tests to our code
 * Make use of the golang test suite, but also make use of bash script testing
   - Bash script testing can be useful for testing the overall performance through a CLI
   - Golang testing is preferable for testing functionality of packages and libraries
 * For Golang testing:
   * Make use of table driven testing where possible and not-cumbersome
     - [Inspiration](https://dave.cheney.net/2013/06/09/writing-table-driven-tests-in-go)
   * Make use of [assert](https://godoc.org/github.com/stretchr/testify/assert) and [require](https://godoc.org/github.com/stretchr/testify/require)
 * For Bash testing: 
   * Checkout [shunit2](https://github.com/kward/shunit2) and [bats](https://github.com/sstephenson/bats)

## Errors 

 * Make use of [pkg/errors](https://github.com/pkg/errors) for stack tracing if you have set a `--debug` option in your application
 * UP FOR DISCUSSION: To maximize code portability wherever possible check errors in place and return them, aka. do not hand off to another function for checking and exiting (for example `ExitOnErr(err error)`

## Config
  
 * Currently the TOML filetype is being used for config files
 * A good practice is to store the default Config file under `~/.[yourAppName]/config.toml`
 * Implement your config setup with [Viper](https://github.com/spf13/viper)

## CLI

 * When implementing a CLI use [Cobra](https://github.com/spf13/cobra) and [Viper](https://github.com/spf13/viper)
 * Wherever possible return errors instread of exiting the application. This allows for the application optionally 
 print a stack trace of the error if a `--debug` flag is used with your application, which is probably a good idea.
 * By default to not print a full error stack trace for applications, but only print an error
 * Instead of using pointer flags (eg. `FlagSet().StringVar`) use viper to retrieve flag values (eg. `viper.GetString`)
   - The flag key used when setting and getting the flag should always be stored in a 
   variable taking the form `FlagXxx` or `flagXxx`.
   - Flag short variable descriptions should always start with a lower case charater as to remain consistent with 
   the description provided in the default `--help` flag.

## Version

 * Every repo should have a version/version.go file that mimicks the tendermint core repo
 * We read the value of the constant version in our build scripts and hence it has to be a string

## Non-Golang Code

 * For indentation, all non-go code (`*.proto`, `Makefile`, `*.sh`) should use:
   - 4 spaces per tab
   - _vim-tip_ Add to .vimrc file:
```
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" for auto-intendentation on save:
autocmd BufWritePre *.sh exec "normal gg=G``zz"
```
   
