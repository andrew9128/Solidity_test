// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_07 {
    mapping(uint => string) public athletes;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function addAthlete(uint index, string memory athlete) public {
        athletes[index] = athlete;
    }

    constructor() {
        owner = msg.sender;
        addAthlete(0, "John Doe");
        addAthlete(1, "Jane Smith");
        addAthlete(2, "Mike Johnson");
    }

    function updateAthlete(uint index, string calldata newAthlete) public {
        athletes[index] = newAthlete;
    }

    function replaceAllAthletes(string[] calldata newAthletes) public onlyOwner {
        require(newAthletes.length == 3, "Must provide exactly 3 athletes");
        for (uint i = 0; i < 3; i++) {
            athletes[i] = newAthletes[i];
        }
    }

    function getAthlete(uint index) external view returns (string memory) {
        return athletes[index];
    }

    function athleteExists(uint index) public view returns (bool) {
        return bytes(athletes[index]).length > 0;
    }

    function removeAthlete(uint index) public onlyOwner {
        delete athletes[index];
    }

    function getAllAthletes() public view returns (string[] memory) {
        string[] memory allAthletes = new string[](3);
        for (uint i = 0; i < 3; i++) {
            allAthletes[i] = athletes[i];
        }
        return allAthletes;
    }

    function addAthleteExternal(uint index, string calldata athlete) external {
        athletes[index] = athlete;
    }
}
