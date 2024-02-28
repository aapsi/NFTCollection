// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    error BasicNft__TokenUriNotFound();

    uint256 public tokenCounter;
    mapping (uint256 tokenId => string tokenUri) tokenIdToUri;

    constructor() ERC721("Dogie", "DOG") {
        tokenCounter = 0;
    }

    function mint(string memory tokenURI) public {
        tokenIdToUri[tokenCounter] = tokenURI;
        _safeMint(msg.sender, tokenCounter);
        tokenCounter++;
    }

    function getTokenUri(uint256 Id) public view returns(string memory){
        if(ownerOf(Id) == address(0)) {
            revert BasicNft__TokenUriNotFound();
        }
        return tokenIdToUri[Id];
    }

    function getCurrentTokenId() public view returns(uint256) {
        return tokenCounter;
    }


}
