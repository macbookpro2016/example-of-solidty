// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MerkleProof{


    function verify(
        bytes32[] memory proof,
        bytes32 leaf,
        bytes32 root
    ) internal pure returns(bool){
        return processProof(leaf, proof) == root;
    }

    function processProof(
        bytes32 leaf,
        bytes32[] memory proof
    ) internal pure returns(bytes32){
        bytes32 computedHash = leaf;
        for(uint256 i = 0; i < proof.length; i++){
            computedHash = _hashPair(computedHash, proof[i]);
        }
        return computedHash;
    }

    function _hashPair(
        bytes32 a,
        bytes32 b
    ) internal pure returns(bytes32){
        return a < b ?  
    }
}