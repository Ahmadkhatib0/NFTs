// SPDX-License-Identifier: MIT
// pragma solidity >=0.4.22 <0.9.0;
pragma solidity ^0.8.0;

contract ERC721 {
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );
    mapping(uint256 => address) private _tokenOwner;
    // mapping from owner to number of owned tokens
    mapping(address => uint256) private _ownedTokensCount;

    function _exists(uint256 tokenId) internal view returns (bool) {
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

    function balanceOf(address _owner) public view returns (uint256) {
        require(_owner != address(0), "owner query for now-existent token");
        return _ownedTokensCount[_owner];
    }

    function ownerOf(uint256 tokenId) external view returns (address) {
        address owner = _tokenOwner[tokenId];
        require(owner != address(0), "owner query for now-existent token");
        return owner;
    }

    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "ERC721: minting to the zero address");
        require(!_exists(tokenId), "ERC721: token already minted");
        _tokenOwner[tokenId] = to;
        //  _ownedTokensCount[to] = _ownedTokensCount[to] + 1 ; //or
        _ownedTokensCount[to] += 1;
        emit Transfer(address(0), to, tokenId);
    }
}
