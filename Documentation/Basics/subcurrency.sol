// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

// The following contract implements te simplest form of a cryptocurrency. The contract allows only its crerator to create new coins(different issuance schemes are possible).
// Anyone can send coins to each other without a need for registering with a username and password, all you need is an ethereum keypair.




contract Coin {
    // the keyword "public" makes variables accessible from other contracts
    address public minter;
    mapping (address => uint) public balances;

    // events allow clients to react to specific contract changes you declare
    event Sent(address from, address to, uint amount);

    // Constructor code is only run when the contract is created
    constructor(){
        minter = msg.sender;
    }

    // Sends an amount of newly created coins to an address can only be called by the contact creator
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    // Errors allow you to provide information about why an operation failed. They are returned to the cller of the function
    error InsufficientBakance(uint requested, uint available);


    // Sends an amount of existing coins from any caller to an address
    function send(address receiver, uint amount) public {
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

