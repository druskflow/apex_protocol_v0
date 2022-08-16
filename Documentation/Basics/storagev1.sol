// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0; //solidity version

contract SimpleStorage {
    uint storeData;

    function set(uint x) public {
        storeData = x;
    }

    fucntion get() public view returns (uint) {
        return storeData;
    }
}


// first line is the source code licenced under the GPL version 3.0

// A ctontract in the sense of solidity is a collection of code(its functions) and data(its state) that resdes at a specific ddress 
// on the ethereum blockchain.

// The line uint storeData; declares a state variable called storeData of type uint
