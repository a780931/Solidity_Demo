// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Integer{
    int8 public  num1 = 8;
    int16 public  num2  =16;
    uint public  num3 = 32;
    uint public  num4 = 11;
    

    function add(int x,int y) public pure returns(int){
        return (x+y);
    }

}