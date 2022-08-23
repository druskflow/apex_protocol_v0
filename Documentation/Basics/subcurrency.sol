// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

// The following contract implements te simplest form of a cryptocurrency. The contract allows only its crerator to create new coins(different issuance schemes are possible).
// Anyone can send coins to each other without a need for registering with a username and password, all you need is an ethereum keypair.




contract Coin {
    address public minter;// the keyword "public" makes variables accessible from other contracts
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount); // events allow clients to react to specific contract changes you declare

    constructor(){    // Constructor code is only run when the contract is created
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public { // Sends an amount of newly created coins to an address can only be called by the contact creator
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    error InsufficientBalance(uint requested, uint available); // Errors allow you to provide information about why an operation failed. They are returned to the cller of the function

    function send(address receiver, uint amount) public { // Sends an amount of existing coins from any caller to an address
        if (amount > balances[msg.sender])
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
/////////////TEST//////////////

// This contract introduces some new conceptsl

// The line address public minter; declares a state variable of type address. The address type is a 160-bit value that does not allow any arithmetic operations.
// It is suitale for storing addresses of contracts, or hash of the public half of a keypair belongin to external accounts.

// The keywod public automatically generates a function that allows you to access the current value of the state variable from outside of the contract. Without this 
// key word, other conntracts have no way to access the variable. 

// function minter() external view returns (address) { return minter; }
// The function above can be added but you would have a function and state variabel with the same name. You do not need to do this, the compiler figures it out for you.

// The next line, mapping(address => uint) public balances; also creates a public state variable, but it ia a more complex datatype. The mapping type maps addresses to unsigned integeers.

// Mappings can be seen as hash tables which are virtually initialised sich that every possible key exists from the start and is mapped to a value whose byte-representation is all zeros.
// It is neither possible to obtain a list of all keys of a mapping, not a list of all values.

// The getter function created by the public keyword is more complex in the case of a mapping. It looks like the following:
/*function balances(address account) external view returns (uint) {
     return balances[account];
 }*/
// You can use this function to query the balance of a single account

// The line event Sent(address from, address to, uint amount); declares an "event", which is emitted in the last line of the function send. Ethereum clients such as web applications
//  can listen for these events emmitted on the blockchain without much cost. As soon as it is emitted, the listener receives the arguments from, to and amount, which makes it possible
// to track transactions.

// To listen for this event, you could use the following JavaScript code, which uses web3.js to create the Coin contract object, and any user interface calls the automatically generated
// balances function from above:
Coin.Sent.watch({}, '', function(error, result) {
    if (!error) {
        console.log("Coin transfer: " + result.args.amount +
            " coins were sent from " + result.args.from + 
            " to " + result.args.to + ".");
        console.log("Balances now:\n" + 
            "Sender: " + Coin.balances.call(result.args.from) + 
            "Receiver: " + Coin.balances.call(result.args.to));
    }
})
