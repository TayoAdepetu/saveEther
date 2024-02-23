// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleVoteSys.sol";

contract SimpleVoteSysFactory {
    address[] public SimpleVoteSystems;

    function createSimpleVoteSys(string[] memory candidates) external {
        address newSimpleVoteSys = address(new SimpleVoteSys(candidates));
        SimpleVoteSystems.push(newSimpleVoteSys);
    }

    function getAllSimpleVoteSystems()
        external
        view
        returns (address[] memory)
    {
        return SimpleVoteSystems;
    }
}
