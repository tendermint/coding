Here lies the list of all the repositories and binaries maintained and produces under the tendermint and cosmos organizations. All repos are written using `go` unless otherwise noted

## Tendermint GH

### Core repos
- [Tendermint Core](https://github.com/tendermint/tendermint) is the core consensus protocol. It produces one binary: `tendermint` and contains the documentation for the details of tendermint core and how to use it in conjunction with other tools.
- [ABCI](https://github.com/tendermint/abci) is the Application BlockChain Interface. It produces three binaries: `abci-cli`, `dummy`, and `counter`, with the latter two used as example apps. There are other implementations in different languages produced by community members.
- [Merkleeys](https://github.com/tendermint/merkleeyes) is an ABCI application serving a merkle-tree key-value store.
- [Basecoin](https://github.com/tendermint/basecoin) is a crypto-currency framework used for building applications. It produces five binaries: `basecoin`, `basecli`, `baseserver`, `eyes`, `eyescli`. Some of these will be moved into `cosmos/examples`.
- [Ethermint](https://github.com/tendermint/ethermint) is Ethereum running on Tendermint consensus. It produces the `ethermint` binary, and is run in conjuction with `tendermint`.

- js-weave?

### Support repos
- [light-client](https://github.com/tendermint/light-client) is, well, a light-client for tendermint. It comes as `tmcli` and supports signatures, proofs, and validation.
- [tmlibs](https://github.com/tendermint/tmlibs) contains libraries commonly used across the stack and has no binaries.
- [tools](https://github.com/tendermint/tools) has various tools for setting up network, deploying testnets, monitoring, and benchmarking.
- [website](https://github.com/tendermint/tendermint.github.io) is the code the https://tendermint.com website
- [ethermint-website](https://github.com/tendermint/ethermint-website) is the code for https://ethermint.network
- [go-crypto](https://github.com/tendermint/go-crypto) could have been part of tmlibs but stands alone for various reasons.
- [testnets](https://github.com/tendermint/testsnets) has the config files for joining testnets.
- [homebrew](https://github.com/tendermint/homebrew-tendermint) taps are found in this repo.

### Example repos
- [trackomatron](https://github.com/tendermint/trackomatron) is an example application for managing invoices using a blockchain.
- [rust-abci](https://github.com/tendermint/rust-abci) is a rust implementation of the ABCI protocol for tendermint core.
- [js-abci](https://github.com/tendermint/js-abci) contains the JavaScript ABCI libraries, used in some example tutorials.


### To deprecate
- counter (can go in `cosmos/examples`)
- tm-momitor (in `tendermint/tools`)
- eth-pegzone (can go in a cosmos repo or elsewhere? [it's just a few documents])
- basecoin-examples
- all other repos from ~ page 2 onwards should be marked as DEPRECATED or simply deleted

## Cosmos GH

- [academy](https://github.com/cosmos/academy) is where all the cosmos related educational material is located
- [examples](https://github.com/cosmos/examples) could be a directory inside the academy...?
- [delegation-game](https://github.com/cosmos/delegation-game) is the UI for the delegation game to be used in the cosmos network.

### To cleanup

- [cosmos](https://github.com/cosmos/cosmos) is almost the same as 
- [cosmos website](https://github.com/cosmos/cosmos.github.io) - these should be consolidated
- [gaia](https://github.com/cosmos/gaia) is unclear, as is 
- [economics](https://github.com/cosmos/economics) which should all be deduplicated
- [constitution](https://github.com/cosmos/constitution) has nothing and whatever was planned for it should go elsewhere.
- [interchain-foundation]((https://github.com/cosmos/interchain-foundation) doesn't have a URL.


### Fundraiser tools

All repos prefixed with `fundraiser` in any way were use for the fundraiser and can be left as-is.
