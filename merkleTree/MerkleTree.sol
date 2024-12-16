// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../MerkleProof.sol";

// merkel网站:https://lab.miguelmota.com/merkletreejs/example/
/**
    [
    "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", 
    "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2",
    "0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db",
    "0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB"
    ]
 */
contract MerkleTree is ERC721{

    bytes32 immutable public root;

    mapping(address => bool) mintedAddress;

    // 构造函数 初始化NFT合集的代号，名称 merkle树的根
    constructor(string memory name, string memory symbol, bytes32 initRoot)
    ERC721(name, symbol){
        root = initRoot;
    }

    // 利用merkle libiary中的verify方法
    function _verify(bytes32 leaf,bytes32[] memory proof)
    internal
    view
    returns(bool){
        return MerkleProof.verify(proof, leaf, root);
    }

    // 计算account的hash值，作为叶子结点
    function computedLeafHash(address account)
    internal pure returns(bytes32){
        return keccak256(abi.encodePacked(account));
    }



    // 利用merkle树验证地址并完成mint
    function mint(address account, uint256 tokenId, bytes32[] calldata proof)
    external{
        require(_verify(computedLeafHash(account), proof), "invalid merkle proof");
        require(!mintedAddress[account], "Already minted!");
        _mint(account, tokenId);
    }

    
}