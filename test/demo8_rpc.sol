// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// interface IERC20  {
//     function balanceOf(address account) external view returns (uint256);
// }

contract TEST{

    function testRpc(address token,address to) external view returns(uint){
        IERC20 erc20 = IERC20(token);
        return erc20.balanceOf(to);
    }

}