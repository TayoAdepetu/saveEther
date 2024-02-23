// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoteSys {
    struct Option {
        string name;
        uint256 voteCount;
    }

    mapping(address => bool) public hasVoted;
    mapping(string => Option) public options;

    string[] public optionNames;

    constructor(string[] memory _optionNames) {
        for (uint256 i = 0; i < _optionNames.length; i++) {
            options[_optionNames[i]] = Option({
                name: _optionNames[i],
                voteCount: 0
            });
            optionNames.push(_optionNames[i]);
        }
    }

    function vote(string memory _option) external {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(
            bytes(options[_option].name).length > 0,
            "Option does not exist."
        );

        options[_option].voteCount++;
        hasVoted[msg.sender] = true;
    }

    function getOptionVoteCount(
        string memory _option
    ) external view returns (uint256) {
        return options[_option].voteCount;
    }
}
