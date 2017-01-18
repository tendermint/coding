# Coding

Let's collect some ideas of best practices and resources to improve our code.

## Go Coding Practices

To write [effective go](https://golang.org/doc/effective_go.html) (a must read), one must think in go.  And not try to translate patterns from other languages into go. Trying to translate java's class hierachies or python's dynamism into go, only makes a indecipherable mess... But if you design from the ground up using "idiomatic" go idioms, the code becomes more maintainable, extensible, and performant.

We all are in a journey to master go, let's share our knowledge here.  Please add links to any articles that provided you with new insights into the language.

But first, take a look at [tendermint coding standard (WIP)](Coding_standard.md)

### Best practices

- [Naming](https://talks.golang.org/2014/names.slide#1)

### Inspiration

**TODO**


## Know your tools

Everyone has a prefered editor, IDE, whatever.  No need to fight about which is best, but we can share some tricks we learned about our favorite editor to help others that use the same one.

**TODO - ALL**: add links to the editor you use

  * [Sublime](editors/Sublime.md)

There is also a quite powerful ecosystem of command line tooling for go programming.  Here are some to check out:

  * [std tools](https://godoc.org/cmd) - especially `go vet` and `go doc`
  * [X tools](https://godoc.org/golang.org/x/tools/cmd) - especially `goimports`, `gorename`, `
  * [golint](https://github.com/golang/lint)
  * Your ideas here...


## Testing

Automated testing is an indispensible part of making sure code is reliable, and also great to make sure *no one else* breaks *your* precious code. However, it is also good to do hand-in-hand with writing the code, as it will often help you design the code better.

I think [TDD](http://blog.cleancoder.com/uncle-bob/2016/11/10/TDD-Doesnt-work.html) takes the practice too far.  But personally, I like to write a file, then write tests for it, and realize the design is a bit awkward, and fix it.  I also find where I need flexibility for mocking (eg. accept an interface rather than a concrete type), which often also helps locate the parts I will want to generalize later on in any case. When I have some basic tests, I can move on and build on the code with much more confidence.

So, yeah, it's not just about churning out test code, and going for 80-90% coverage, it's about changing the way to think about code.  The first client for your codebase is your test code.  It's easy to see if it works well.  Then you can use it for your server, your cli, etc...

## Production Code

Going from nice, tested code on your laptop, to running in production (unsupervised code on some cloud server somewhere, facing high load, attacks, and "user errors") is far more than writing a nice deploy script.

Some issues that need considering (should become their own pages):

  * Logging
  * Metrics
  * Error Reporting
  * Security
  * Robustness
  * Deployment

## Performance


## Architecture

Last, but definitely not least, is the architecture.  You can have the best tested, instruments, and stable code, but if the fundamental design of the system (aka architecture) was poorly thought out, it will not be able to go far.

This is very much an art, and considers how data flws through the system, how to divide responsibilities, which layers can be abstracted and which are intrinsic to the system, etc.  I mean the high-level architecture of the entire tendermint project is basically:

  * A blockchain is simply consensus on a unique global ordering of events.
  * This consensus can efficiently be implemented using BFT and PoS
  * This code can be generalized to easily support a large number of blockchains
  * The block-chain specific code, the interpretation of the individual events, can be implemented by a 3rd party app without touching the consensus engine core
  * Use an efficient, language-agnostic layer to implement this (ABCI)

I think this was a stroke of genius.  And since the tendermin project has started, this basic architecture decision has only been reinforced.

Each component of the system also has its own architecture, some more thought out some less. I think we should make this architecture more explicit and review the basic design. Development should fit inside this basic design, or if it cannot, bring up a discussion on the design to make it better, and capable of handling this feature and oh-so-many more.

Anton shared a proposal of how a group can document and extend the architecture design.
 **TODO**
