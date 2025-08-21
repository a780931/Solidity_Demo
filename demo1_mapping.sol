// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Mapping{
    mapping(address=> uint) balances;
    function update (uint x)public {
        balances[msg.sender] = x;
    }

    function get()public  view returns (uint) {
        return balances[msg.sender];
    }
}