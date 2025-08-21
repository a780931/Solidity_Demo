// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import ".deps/remix-tests/remix_accounts.sol";

contract TestStruct{
    event Received(address sender, uint amount);

    error NotAdult();
    string  public  str ="123";
    struct User{
        string name;
        uint age;
    }
    mapping (address=> User) userMap;

    function getAddress(uint x)  public pure returns(address){
        return TestsAccounts.getAccount(x);
    }

    function setUser(string memory x,uint y)public {
        require(y > 18,"user is not a adult!");
        userMap[msg.sender] = User(x, y);
        assert(y>20);
        revert NotAdult();

    }

    function getUser()public view returns ( User memory){
        return userMap[msg.sender];
    }

    function getBalance()public view returns ( uint){
        return address(this).balance;
    }

    receive() external payable {
        emit Received(msg.sender,msg.value);
     }
}