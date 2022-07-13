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
