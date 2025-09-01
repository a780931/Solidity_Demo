// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Vote {
    struct VoteDto{
        uint tickets;
        address[] voters;
    }
    mapping (address=>uint) private  votesReceived;

    address[] private  candidateList;

    function vote(address _candidate) public returns(bool){
        if(votesReceived[_candidate] == 0){
            candidateList.push(_candidate);
        }
        votesReceived[_candidate] +=1;
        return true;
    } 

    function getVotes(address _can) public view  returns (uint){
        return votesReceived[_can];
    }

    function resetVotes()public returns (bool){
        for(uint i = 0; i< candidateList.length;i++){
            votesReceived[candidateList[i]] = 0;
        }
        return true;
    }
}