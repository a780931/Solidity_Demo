// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
contract BeggingContract  is ReentrancyGuard{
    mapping (address=>uint) public donations;

    function donate ()  payable external {
        donations[msg.sender] += msg.value;
    }

    function withdraw (uint amount)  external  nonReentrant   returns (bool) {
        require(donations[msg.sender] > amount, "no balance!");
        (bool success, ) = msg.sender.call{value: amount}("");
        if(success){
            donations[msg.sender] -= amount;
        }
        return success;
    }

    function getDonation(address addr) view external returns (uint) {
        return donations[addr];
    } 
}