// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Task_04 {
    function generateFibo(uint256 n) public pure returns (uint256) {
        if (n == 0) {
            return 1;
        }
        
        uint256 a = 0;
        uint256 b = 1;
        uint256 fib;
        
        do {
            fib = a + b;
            a = b;
            b = fib;
        } while (fib <= n);
        
        return fib;
    }
}
