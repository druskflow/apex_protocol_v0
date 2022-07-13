// blockchain demo.

// Hash - a unique fixed length string, meant to identify a piece of data. They are created
// by placing said data into a "hash function".  
// Hash Algorithm - a function that computes data into a unique hash.

// Mining - he process of finding the "solution" to the bockchain "problem".
// In our "problem", we were to find a hash that starts with four zeros.

//  Block - a list of transactions mined together.

// Decntralized - having no single point of authority.

// Nonce is the number used once to fint the solution to the blockchain problem. It is also used to define the
// transaction number for an account/address.

// eth uses sha-3.

// Whatever info you put, the hash changes. It is a unique fixed length string that identifies data.

// For block concept
// Split into Block, Nonce and Data - all combined to provide the hash  ---> andersbrownworth.com/blockchain.

// Genesis block - the first block ibn a blockchain. Where the previous hash points to a hash that doesn't exist.

// Nothing can be changed. Blockchains are immutable. Changing one thing ruins the rest of the blockchain - can 
// only be changed by owner of the block - Now the concept of peer comes in when one peer changes their data.
// if peer A has a didfferent prevous block data than B and C then the next block he will be kicked out of the chain.



// Elliptic Curve Digital Signature Algorithm - offers a variant of the didgital signature algorithm DSA which uses elliptic curve algorithm.

// Public key - everyone has access to, 
// Private key - used to didgitally sign transactions where people can verify with the public key.

// Signing a transaction - A "one way" process. Someone with a private key signs a transaction by their private key being
// hashed with their transaction data.
// Anyone can then verify this new transaction hash woth your public key.

// Private key creates Public key which creates Address

// Blockchain nodes keep lists of the transactions that occur

// Consensus/ Proof of Stake/ Proof of Work
// Consensus is the mechanism used to agree on the state of a blockchain. Majority rule(example)
// Chain Seection and Sybil Resistance(used by btc and eth)
// Proof of work is known as Sybil resistance mechanism as it defines a way to figure out who is the block author.

// Proof of work - a single node has to go through a very computational expensive process called mining to figure out the real owner.
// No matter what pseudoanonymous accounts are only one is picked

// Chain Selection, how to know which block to pick
// Nakamoto Coonsensus - is a combination of proof of work and longest chain rule. The decentralized network decides whichever blockchain has
// the longest chain or the highest number of blocks is going to be the chain to be used 



// Attacks 
// Sybil Attack - when a user creates a whole bunch of pseudoaccounts to try and influence the network. 
// 51% Attack - if oyu have the longest chain and have more than 51% match on the network you can fork the network and bring it to your chain.
// The bigger the network the more decentralized it is and the more secure it becomes. Run a node and contribute to the network

// Proof of Work costs a lot of energy

// Proof of Stake(PoS) - more environmental friendly as it does not use a lot of energy. Prof of Stake don't need to solve the problems
// they put up collateral that they will behave honestly.
// Proof of Stake nodes put up collateral as a syvil resistance mechanism
// Miners are known as validators.

// Randomness - These blockchains are deterministic and by law randomness cannot exist in a deterministic system
// How to choose the ranomb validators. It chancges from blockchain to blockchain. 


// Sharding - c a solution to the scalability problem. As more people getting into the network the gas feessky rocket
// A sharded blockchaion b=means it is going to be a blockchain of blockchains. There will be a mainchain that will coordinate everything 
// amongst several chains that hook into this mainchain. This means that there is more chains for more people to make transactions on 
// effectively increasing the amount of bock spaces. 

// Layer 1 - Base layer blockchain implementation e.g btc, eth, avalanche
// Layer 2 - Applicatiyons built on a layer 1 e.g chainlink, arbitrum and optimism