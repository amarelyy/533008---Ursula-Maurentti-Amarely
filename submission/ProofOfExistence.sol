// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProofOfExistence {
    address public owner;
    mapping(bytes32 => uint256) public proofs;
    
    event DocumentNotarized(address indexed sender, bytes32 indexed documentHash, uint256 timestamp);

    constructor() {
        owner = msg.sender;
    }

    function notarizeDocument(bytes32 _documentHash) public {
        require(proofs[_documentHash] == 0, "Document already notarized");
        proofs[_documentHash] = block.timestamp;
        emit DocumentNotarized(msg.sender, _documentHash, block.timestamp);
    }

    function verifyDocument(bytes32 _documentHash) public view returns (bool) {
        return proofs[_documentHash] > 0;
    }
}