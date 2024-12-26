// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "../ERC721.sol";

contract WTFApe is ERC721{
    uint public MAX_APES = 1000; // 声明总量

    // 实现构造函数
    constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_){}

    // BYC的baseUrl为ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/ 
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/";
    }
    // 铸币函数
    function mint(address to, uint tokenId) external {
        require(tokenId >= 0 && tokenId < MAX_APES, "tokenId out of range");
        _mint(to, tokenId);
    }
}