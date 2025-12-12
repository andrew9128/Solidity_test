// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_08 {
    address public owner;
    constructor() { owner = msg.sender; }

    function getDynamicByteArrayLength(bytes memory _data) public pure returns (uint256) {
        return _data.length;
    }

    // Решение задания
    function getDynamicByteArrayElement(bytes memory _data, uint index) public pure returns (bytes1) {
        require(index < _data.length, "Index out of bounds");
        return _data[index];
    }
}