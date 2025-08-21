// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract test{

    string public hello ="hello 0.8";
    int public  num1 =123;
    uint public  num2 =234;
    uint[]  public  arr =[1,2,3,4,5];

    address public  address2 =0x343126F2E0f507d778e1D5fEC5cFc99D06CB079E;

     enum  hash{
        a,
        b,
        c,
        d
    }

    function sayHello(string memory name) public view returns  (string memory){
        return hello;
    }

        function sayHello2(string memory name) public pure  returns  (string memory){
        return name;
    }
}