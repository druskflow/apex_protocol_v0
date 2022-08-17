// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0; //solidity version


contract SimpleStorage{
    uint storedData;

    function set(uint x) public{
        storedData = x;
    }
    function get() public view returns(uint){
        return storedData;
    }

}
// first line is the source code licenced under the GPL version 3.0

// A ctontract in the sense of solidity is a collection of code(its functions) and data(its state) that resdes at a specific ddress 
// on the ethereum blockchain.

// The line uint storeData; declares a state variable called storeData of type uint(unsigned integer of 256 bits). You can think of it as a single slot
// in a database that you can query and alterby callin functions of the code that maanages the database.
// In this example, the contract defines the functions set and get that can be used to modify and retrieve the value of the variable.

// To access a member(like a state variable) of the current contract, you do not typically add the this. prefix, you just access it directly via its name.
// This ontract only allows to store a single number that is accessible by anyone in the world without a (feasable) way to prevent you frompublishing this number.
// Any one vould call set again with a diffeent value and overwrite your number, but the number is still stored in the history of the blockchain. 
// Later, you will see how you can impose access restrictions so that only you can alter the number.
