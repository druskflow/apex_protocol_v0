// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

// define contract
contract SimpleStorage {
    
    // this will get initialized to 0! 
    uint256 favoriteNumber;
    bool favoriteBool;
    // string favoriteString = "String";
    // int256 favoriteInt = -5;
    // address favoriteAddress = 0xC3463f6254A258D70eF8b5E4FAf314f454C8AEA5;
    // bytes32 favoriteBytes = "cat";


 // a list of people or group to store their favorite number and associate a sinle person to a number
    // struct
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // People public person = People({favoriteNumber: 2, name: "Patrick"}); - for a single person
    // create an array for multiple people
    People[] public people;
    // data steructure calle mapping, helps find someone with name only if you don't know the number
    mapping(string => uint256) public nameToFavoriteNumber;
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view, pure - two keywords that define functions that you don't need to make a transaction on 
    // view - only reading on the blockchain(non changing state)
    // pure - does some type of math
    // function retrieve() public view returns(uint256) {
    //     return favoriteNumber;
    // }
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    
    // memory or storage - ways to store info.
    // in memory data will be stored during the execution of the function
    // in storage the data will exists even after the function executes
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}

// Notes: All the solidity code here was compiled by the EVM(Ehereum Virtual Machine)