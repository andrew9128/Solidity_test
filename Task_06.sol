// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_06 {
    // Решение задания
    function getMaxUint8() external pure returns (uint8) {
        return type(uint8).max; // или return 255;
    }
}