# Security

Updating apps, signing on the blockchain of "official release" before downloading new native client.

Design:

go light client
  * signing tx, checking proofs, following validators.
  * calling app creates key/values as bytes
  * go app makes all crypto calls, handles keys, etc.
  * communicate securely with local app over unix socket

application
  * has all domain knowledge, client-side logic
  * creates transactions, encode as bytes, send to go to run
  * makes queries to go client
  * go client will verify proofs, etc
  * application places trust in go client


First steps:
  * focus on basecoin
  * build simple go client
  * rebase tmsp_proof
  * write simple js electron app
  * get something to send money, verify tx
  * display with a UI

