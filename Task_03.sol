// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Task_03 {
    function generateFactorial(uint256 n) public pure returns (uint256) {
        if (n == 0) {
            return 1;
        }
        
        uint256 result = 1;
        uint256 i = 1;
        
        while (i <= n) {
            result *= i;
            i++;
        }
        
        return result;
    }
}
