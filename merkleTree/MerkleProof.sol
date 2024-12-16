// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
proof:["0xdfbe3e504ac4e35541bebad4d0e7574668e16fefa26cd4172f93e18b59ce9486","0x9d997719c0a5b5f6db9b8ac69a988be57cf324cb9fffd51dc2c37544bb520d65"]
leaf:"0x04a10bfd00977f54cc3450c9b25c9b3a502a089eba0097ba35fc33c4ea5fcb54"
root:"0xeeefd63003e0e712cb41cd0043015a6e26ddb38073cc6ffeb0ba3e808ba8c097"
 */
library MerkleProof{


    function verify(
        bytes32[] memory proof,
        bytes32 leaf,
        bytes32 root
    ) public pure returns(bool){
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
        return a < b ?  keccak256(abi.encodePacked(a, b)) : keccak256(abi.encodePacked(b, a));
    }
}