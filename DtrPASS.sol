// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract DtrPASS is ERC721Enumerable, Ownable {
    uint256 public MAX_NUM = 10000;
    uint256 public MAX_RESERVE = 1000;
    uint256 public tokenCounter;
    string public baseURI;
    mapping(address => bool) public minterRole;

    constructor() ERC721("DtrPASS", "DtrPASS") {
        minterRole[msg.sender] = true;
    }

    //For Staking Contract.
    function setMinter(address _minter, bool _on) external onlyOwner {
        minterRole[_minter] = _on;
    }

    //public mint
    function mint(address _to) external {
        require(minterRole[msg.sender], "access denied");
        _safeMint(_to, tokenCounter++);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function setBaseUri(string memory _uri) external onlyOwner {
        baseURI = _uri;
    }

    function ownedList(address _user) external view returns (uint256[] memory) {
        uint256 bal = this.balanceOf(_user);
        uint256[] memory list = new uint256[](bal);
        for (uint256 i = 0; i < bal; i++) {
            list[i] = this.tokenOfOwnerByIndex(_user, i);
        }
        return list;
    }
}
