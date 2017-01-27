# Tendermint Coding Standard (WIP)

In order to keep our code looking good with lots of programmers working on it, it helps to have a "coding standard", so all the code generally looks quite similar. This doesn't mean there is only one "right way" to write code, or even that this standard is better than your style.  But if we agree to a number of stylistic practices, it makes it much easier to read and modify new code.

**Current state**: Very rough first proposal - try it out, give feedback, and *please* modify it

Really - please add items here, or modify them if you don't like them.  We have git versioning, don't be afraid of change.

  1. Use `gofmt` (or `goimport`) to format all code upon saving it
  2. Use a linter (see below) and generally try to keep the linter happy (where it makes sense)
  3. For indentation, all non-go code (`*.proto`, `Makefile`, `*.sh`) should use:
    * 4 spaces
    * 1 tab
    * something else??
  4. Think about documentation, and try to leave godoc comments, when it will help new developers. What do you think of the current documentation for [go-merkle](https://godoc.org/github.com/tendermint/go-merkle), [abci](https://godoc.org/github.com/tendermint/abci), and [tendermint](https://godoc.org/github.com/tendermint/tendermint)?

## Linters

  * [lint](https://github.com/golang/lint) *required*
  * [gometalinter (all other linters)](https://github.com/alecthomas/gometalinter) *optional*
    * Anton, can you please add a sample configuration for gometalinter that we could use?  Maybe we add this to tendermint repo if we want to agree on some stylistic conventions

## Various

  * Reserve "Save" and "Load" for long-running persistence operations.  When parsing bytes, use "Read" or "Write".
  * Avoid single variable names, be more descriptive, and try to maintain consistency across the codebase.
