// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Array{
    uint[]  public  arr =[1,2,3,4,5];
    string[] public arr2 = ["asd","123","qwe"];

    function get() public view  returns (string[] memory){
        return arr2;
    }
    function add(uint x) public {
        arr.push(x);
    }
    function remove(uint x) public {
        arr.pop();
    }
    function addAll(uint[] memory x)public {
        for (uint i = 0; i < x.length; i++) 
        {
         arr.push(x[i]);   
        }
    }

    function addStr(string memory x)public {
        bytes memory bys = bytes(x);
        bytes memory temp = new bytes(1);
        for(uint8 i = 0;i < bys.length;i++){
            temp[0] = bys[i];
            arr2.push(string(temp));
        }
    }
}