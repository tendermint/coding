# Tendermint Coding Standard (WIP)

In order to keep our code looking good with lots of programmers working on it, it helps to have a "coding standard", so all the code generally looks quite similar. This doesn't mean there is only one "right way" to write code, or even that this standard is better than your style.  But if we agree to a number of stylistic practices, it makes it much easier to read and modify new code.

**Current state**: Very rough first proposal - try it out, give feedback, and *please* modify it

Really - please add items here, or modify them if you don't like them.  We have git versioning, don't be afraid of change.

 1. Use `gofmt` (or `goimport`) to format all code upon saving it
 2. Use a linter (see below) and generally try to keep the linter happy (where it makes sense)
 3. Think about documentation, and try to leave godoc comments, when it will help new developers. What do you think of the current documentation for [go-merkle](https://godoc.org/github.com/tendermint/go-merkle), [abci](https://godoc.org/github.com/tendermint/abci), and [tendermint](https://godoc.org/github.com/tendermint/tendermint)?

## Linters

 * [lint](https://github.com/golang/lint) *required*
 * [gometalinter (all other linters)](https://github.com/alecthomas/gometalinter) *optional*
  - Anton, can you please add a sample configuration for gometalinter that we could use?  Maybe we add this to tendermint repo if we want to agree on some stylistic conventions
 * [shellcheck](https://github.com/koalaman/shellcheck) *required*

## Various

 * Reserve "Save" and "Load" for long-running persistence operations.  When parsing bytes, use "Read" or "Write".
 * Avoid single letter variable names, be more descriptive, and try to maintain consistency across the codebase.
  - JAE: This conflicts with https://talks.golang.org/2014/names.slide#7
 * Do not use "instance" in function names
 * In comments, use "iff" to mean, "if and only if".  (It's not a typo)

## Importing Libraries
Sometimes it's necessary to rename libraries to avoid naming collisions or ambiguity. 

 * UP FOR DISCUSSION: Do not label libraries with their default name (aka: wire "github.com/tendermint/go-wire") 
 * Here are some common library labels for consistency: 
  - dbm "github.com/tendermint/go-db"
  - cmn "github.com/tendermint/go-common"
  - tmcmd "github.com/tendermint/tendermint/cmd/tendermint/commands"
  - tmcfg "github.com/tendermint/tendermint/config/tendermint"
  - tmtypes "github.com/tendermint/tendermint/types"
 * Avoid using the `.` library import or `go-common`. The `.` import is replaced throughout tendermint libraries
 * tip: Use the `_` library import to import a library for initialization effects (side effects) 

## Testing

 * Add Tests! 
 * Make use of table driven testing where possible and not-cumbersome
  - [Inspiration](https://dave.cheney.net/2013/06/09/writing-table-driven-tests-in-go)
 * Make use of [assert](https://godoc.org/github.com/stretchr/testify/assert) and [require](https://godoc.org/github.com/stretchr/testify/require)

## Errors 

 * Make use of [pkg/errors](https://github.com/pkg/errors) for stack tracing if you have set a `--debug` option in your application
 * UP FOR DISCUSSION: To maximize code portability wherever possible check errors in place and return them, aka. do not hand off to another function for checking and exiting (for example `ExitOnErr(err error)`

## Config
  
 * Currently the TOML filetype is being used for config files
 * A good practice is to store the default Config file under `~/.[yourAppName]/config.toml`
 * Implement your config setup with [Viper](https://github.com/spf13/viper)

## CLI

 * When implementing a CLI use [Cobra](https://github.com/spf13/cobra)
 * Wherever possible return errors instread of exiting the application. This allows for the application optionally print a stack trace of the error if a `--debug` flag is used with your application, which is probably a good idea.
 * By default to not print a full error stack trace for applications, but only print an error

## Questions

 * For indentation, all non-go code (`*.proto`, `Makefile`, `*.sh`) should use:
  - 4 spaces
  - 1 tab
  - something else??
