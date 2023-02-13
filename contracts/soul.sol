// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "@openzeppelin/token/ERC721/ERC721.sol";
import "@openzeppelin/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/access/Ownable.sol";
import "@openzeppelin/utils/Counters.sol";


contract Moodnet is ERC721, ERC721URIStorage, Ownable {
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    
    address public operator;

    constructor() ERC721("Moodnet", "MN") {
        operator = msg.sender;
    }

    mapping (address => string) private dnsName;
    mapping (string => address) private dnsAddress;

    uint256 public cost = 0.05 *10**18;
    
    function safeMint(address _to, string memory _uri) public virtual payable {
        require(msg.value >= cost, "Not enough money on your account");
        require(msg.sender != _to, "You can't assess yourself");
        
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        
        _safeMint(_to, tokenId);
        _setTokenURI(tokenId, _uri);

    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

}