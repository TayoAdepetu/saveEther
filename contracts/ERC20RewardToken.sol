// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

//So that I can use console.log
import "hardhat/console.sol";

//So that I can use Open Zeppelin ERC20 Token Standard
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20RewardToken is ERC20 {
    constructor() ERC20("ERC20RewardToken", "ERC20RT") {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }
}
