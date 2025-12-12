// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_05 {
    enum Status {
        Pending,
        Active,
        Inactive
    }

    Status public currentStatus;

    function setStatus(Status _status) external {
        currentStatus = _status;
    }

    // Решение задания (в задании была опечатка getBalance, здесь логичное имя)
    function getStatus() external view returns (Status) {
        return currentStatus;
    }
    
    // Дубликат для совместимости с текстом задания, если требуется
    function getBalance() external view returns (uint) {
        return uint(currentStatus);
    }
}