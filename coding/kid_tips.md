# Kid Tips

<<  This document is alive, but is currently out of date >>

Basic stuff because we all really have know clue what we're doing until 
we instantly understand and forget to document our struggles

## Acronyms/short-forms to be aware of:
- tx - transaction
- chain/chainId
  - Within basecoin for instance chain id is used to specify which blockchain basecoin will be a part of, currently tendermint only supports 1 block chain so this may seem irrelevant, however this term is very relevant for interblock chain communication
- IBC - inter-blockchain communication
- PR - Github pull request
- State - state of an application
- Store - data access to data storage (such as merkle tree etc.)
- CLI - command line interface
- Abci - Application BlockChain Interface
- Tsp (teaspoon) - Tendermint Socket Protocol
- In-proc - in process
  - Tendermint is said to run in-proc, when it runs as a part of the same process stream as your root abci application, as opposed to running in a separate process on the operating system
 
## Package installation and initialization:
All of Tendermint currently makes use of Makefiles, and the standard architecture used for makefile. https://en.wikipedia.org/wiki/Makefile
Before attempting to install a project one should run the `Make all` from the root project directory. Typically `Make all` will get the vendor deps and run install. Alternatively those commands can be run individually with `make get_vendor_deps` followed by `make install`. Open up the Makefile to get a better idea of the commands being run triggered by the make commands.
 
## Project Structure 
Each project’s main method or executable is located under the cmd/ folder on the root project folder. In some projects (such as abci) multiple executables are compiled as a part of the same project, don’t let this confuse you, they are totally different packages but co-existing in the same repo, they would run all the same if they were ripped apart into two different repos. 
 
## Git
Always work from develop branch. When making changes open a new branch 
and PR the develop branch with your changes. All golang projects are stored 
with the following structure <GOPATH>/bin/github.com/<author>/<reponame>... 
make sure to store new projects under this structure, and similarly properly 
reference with it. Some useful git commands:
- view commits
  - git log --oneline -n 10
- Delete branch
  - git branch -d <branchName>
- Squash (squash multiple commits together)
  - git rebase -i HEAD~10
- Get current hash
  - git rev-parse --short HEAD
- Undo/Redo last commit (before a push)
  - git commit -m "Something terribly misguided"
  - git reset HEAD~                             
  - << edit files as necessary >>               
  - $ git add ...                               
  - git commit -c ORIG_HEAD  (use -C if commit msg doesn't need any changes)
- Retrieve New Branch
  - git checkout -b somebranch tendermint/<somebranch>
- Updating Local Repos
  - git fetch -a origin
  - git reset --hard origin/<branch-2-update>
  - git reset --hard <commit hash> 
- Track issues from command line with ghi (https://github.com/stephencelis/ghi)
- Rebasing code when there is conflict
  - Backup your branch remotely
  - git fetch -a origin
  - git rebase origin/<rebase-branch> (usually master/develop)
  - if errors go through the code and fix, 
    - All errors will have <<<<<<<<<< <other commit>
                               <some code>
                               ===========
                                <you’re code>
                               >>>>>>>>>>> <your commit>
    - Then use: git add -u
  - git rebase --continue
  - git status

## General Go Tips
- Use of the library import which begins with a ‘.’ 
  - Sometimes the go-common package is imported with the ‘.’ package shortcut, this effectively imports all of the go-common functions without needing to reference the package when calling them.
- Should not use the word “instance” in method names, the fact that something is an instance should be implied by the code
- Do not use underscores (_) in names, only use case is for golang testing, use camelCase

## Important Golang Elements
Really take the time the fully graphs interfaces and types, 
the differences and how they’re used. https://gobyexample.com/interfaces, https://tour.golang.org/basics/11, 
https://www.golang-book.com/books/intro/9
Further check out:
- struct variables https://talks.golang.org/2012/10things.slide#1
- function variables https://www.golang-book.com/books/intro/7#section4
- empty interface https://tour.golang.org/methods/14
- maps https://blog.golang.org/go-maps-in-action
- Use of the semicolon (;) for compressed code
 
## How to reimplement tendermint-core elements to run in procedure
big one, the concept of how to apply tendermint in-proc, by reimplementing the `tendermint node` CLI command should be rigorously documented
 
## Usage of Protobuf
Abci is built on protobuf, good to understand
https://tendermint.com/docs/guides/app-development
https://developers.google.com/protocol-buffers/
 
## Learn JSON for Golang
Json is riddled in almost every element of tendermint - very important to thoroughly understand it. 
https://gobyexample.com/json
https://www.dotnetperls.com/json-go
 
## Golang Test Suite, Table Driven Testing
Testing can be performed mechanistically with golang, very useful to write test packages as-you-go. 
https://golang.org/pkg/testing/
https://dave.cheney.net/2013/06/09/writing-table-driven-tests-in-go
 
## Threading in go is really great and interesting and also all over tendermint

Concurrency
- https://www.golang-book.com/books/intro/10

Locks
- https://golang.org/pkg/sync/
- https://gobyexample.com/mutexes

Channels
- https://tour.golang.org/concurrency/2
- https://gist.github.com/mattetti/3798173
