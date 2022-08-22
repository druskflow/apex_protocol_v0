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

contract Coin{
    address public minter;
    mapping (address => uint) public balances;

    event Sent (address from, address to, uint amount);
}