// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoteSys {
    struct CandidateStruct {
        string name;
        uint256 totalVote;
    }

    mapping(address => bool) public voterHasVoted;
    mapping(string => CandidateStruct) public candidate;

    string[] public candidates;

    constructor(string[] memory _candidates) {
        for (uint256 i = 0; i < _candidates.length; i++) {
            candidate[_candidates[i]] = CandidateStruct(_candidates[i], 0);
            candidates.push(_candidates[i]);
        }
    }

    function vote(string memory _candidate) external {
        require(!voterHasVoted[msg.sender], "You have already voted.");
        require(
            bytes(candidate[_candidate].name).length > 0,
            "Option does not exist."
        );

        candidate[_candidate].totalVote++;
        voterHasVoted[msg.sender] = true;
    }

    function getOptionVoteCount(
        string memory _candidate
    ) external view returns (uint256) {
        return candidate[_candidate].totalVote;
    }
}
