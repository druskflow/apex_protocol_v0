// SPDX-License-Identifier: MIT

pragma solidity >=0.6.6 <0.9.0;

// Interfaces compile down to an ABI.
// ABI - Application Binary Interface.
// The ABI tells solidity and other programming languages how it can interact with another contract.
// Anytime you wnat to interact with an already deployed smart contract you will need an ABI.

// A library is similar to contracts, but their purpose is that they are deployed only once
// at a specific address and their code is reused.
// The directive using A for B; can be used to attach library functions(from the library A) to 
// any type (B) in the context of a contract. 


import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract FundMe {
    using SafeMathChainlink for uint256;

    mapping(address => uint256) public addressToAmountFunded;

    // function payable means it will be used to pay
    function fund() public payable{
        // $50  - check 
        uint256 minimumUSD = 50 * 10 ** 18;
        require(getConversionRate(msg.value) >= minimumUSD, "You need to spend more ETH!");
        addressToAmountFunded[msg.sender] += msg.value;
        // what the ETH -> USD cconversion rate
    }

    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version(); 
    }

    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (
        //  uint80 roundId
        ,
         int256 answer,
        //  uint256 startedAt
         ,
        //  uint256 updatedAt
         ,
        //  uint80 answeredInRound
         )
        = priceFeed.latestRoundData();
        return uint256(answer * 10000000000);
        // 1473.37198411 - current ether price
    }
    // 1000000000 
    function getConversionRate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        return ethAmountInUsd; 
    } 

}
