// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract TestAddress{
    address myAddress;

    function compareAddress(address a1,address a2) public  pure returns (bool){
        return  a1 == a2;
    }

    function tpBytes(address a1) public  pure  returns(bytes memory){
        return abi.encodePacked(a1);
    } 

    function getBalance(address a1) public  view returns (uint){
        return a1.balance;
    }
    function getThisBalance() public  view returns (uint){
        return address(this).balance;
    }

    function lowCall(address a1,bytes memory data) public returns (bool,bytes memory){
        (bool success,bytes memory result) = a1.call(data);
        return (success,result);
    }
}