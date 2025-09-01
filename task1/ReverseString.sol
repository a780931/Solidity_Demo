// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReverseString{


    function reverse(string memory  ss) public pure  returns (string memory){
      bytes memory s = bytes(ss);
      bytes  memory temp;
        for (uint i = 0; i < s.length / 2; i++) {
             temp[0] = s[0];
             string(temp);
        //    bytes memory haha;
        //    haha[0] =s[0];
        //    return string(haha);
            // Swap the characters at positions i and s.length - 1 - i
            (s[i], s[s.length - 1 - i]) = (s[s.length - 1 - i], s[i]);
        }
    return string(s);
    }
}