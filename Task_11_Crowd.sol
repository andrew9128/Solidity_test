// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_11 {
    address public owner;
    uint public targetAmount;
    uint public totalUserDeposits;
    
    enum State { Active, Paused, Closed }
    State public state;

    mapping(address => uint) public balances;

    event Deposited(address indexed user, uint amount);
    event Withdrawn(address indexed user, uint amount);
    event StateChanged(State newState);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    modifier whenActiveOrPaused() {
        require(state == State.Active || state == State.Paused, "Unavailable in closed state");
        _;
    }

    modifier whenActive() {
        require(state == State.Active, "Contract is not active");
        _;
    }

    modifier whenClosed() {
        require(state == State.Closed, "Contract is not closed");
        _;
    }

    constructor(uint _targetAmount) {
        require(_targetAmount > 0, "Target amount should be > 0");
        owner = msg.sender;
        targetAmount = _targetAmount;
        state = State.Active;
    }

    // Решение:
    function deposit() external payable whenActive {
        require(msg.value > 0, "Deposit must be positive");
        
        balances[msg.sender] += msg.value;
        totalUserDeposits += msg.value;
        
        emit Deposited(msg.sender, msg.value);

        if (totalUserDeposits >= targetAmount) {
            state = State.Closed;
            emit StateChanged(state);
        }
    }

    function pause() external onlyOwner whenActiveOrPaused {
        require(state != State.Paused, "Contract paused");
        state = State.Paused;
        emit StateChanged(state);
    }

    function resume() external onlyOwner {
        require(state == State.Paused, "Contract is not paused");
        state = State.Active;
        emit StateChanged(state);
    }

    // Решение:
    function withdraw() external whenActiveOrPaused {
        require(state == State.Paused, "Withdraw only when paused");
        
        uint amount = balances[msg.sender];
        require(amount > 0, "No balance");

        balances[msg.sender] = 0;
        totalUserDeposits -= amount;
        
        payable(msg.sender).transfer(amount);
        
        emit Withdrawn(msg.sender, amount);
    }

    // Решение:
    function ownerWithdrawAll() external onlyOwner whenClosed {
        uint amount = address(this).balance;
        require(amount > 0, "No funds");
        
        payable(owner).transfer(amount);
    }

    function getState() external view returns (string memory) {
        if (state == State.Active) return "Active";
        if (state == State.Paused) return "Paused";
        if (state == State.Closed) return "Closed";
        return "";
    }
}