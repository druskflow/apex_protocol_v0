// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./SimpleStorage.sol";
// deploying a contract from a contract

// building the factory pattern - eneable everyone to deploy their own list

contract StorageFactory is SimpleStorage { //is SimpleStorage line is inheritance

    SimpleStorage[] public simpleStorageArray;
    // any new creation of the simplestorage contract will be added to the array
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

// create a function that calls the store and retrieve function    
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // address of contract and ABI - the two things needed to interact with a contract
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])); // getting the address
        simpleStorage.store(_simpleStorageNumber); // calling the function 
    }

    // add retrieve
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        return simpleStorage.retrieve();
    }
    // refactoring the code to make it simpler
    // function sfGet(uint256 _simpleStorageIndex) public view return (uint256) {
    //     return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
        
    // }
}
