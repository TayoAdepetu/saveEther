// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract ChainBattles is ERC721URIStorage {
    uint256 private nextTokenId = 1;
    mapping(uint256 => uint256) public tokenIdToLevels;

    constructor() ERC721("Chain Battles", "CBTLS") {}

    function generateCharacter(
        uint256 tokenId
    ) public pure returns (string memory) {
        // Simplified SVG generation
        return
            string(
                abi.encodePacked(
                    "data:image/svg+xml;base64,",
                    Base64.encode(bytes("SVG DATA"))
                )
            );
    }

    function getTokenURI(uint256 tokenId) public pure returns (string memory) {
        // Simplified metadata generation
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(bytes("METADATA"))
                )
            );
    }

    function mint() public {
        uint256 newItemId = nextTokenId++;
        _safeMint(msg.sender, newItemId);
        tokenIdToLevels[newItemId] = 0;
        _setTokenURI(newItemId, getTokenURI(newItemId));
    }

    function train(uint256 tokenId) public {
        require(_exists(tokenId), "Token does not exist");
        require(
            ownerOf(tokenId) == msg.sender,
            "You must own this token to train it"
        );
        tokenIdToLevels[tokenId]++;
        _setTokenURI(tokenId, getTokenURI(tokenId));
    }
}
