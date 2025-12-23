// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_06 {
    mapping(uint => string) public colors;
    address private owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
        addColor(0, "Red");
        addColor(1, "Orange");
        addColor(2, "Yellow");
        addColor(3, "Green");
        addColor(4, "Blue");
        addColor(5, "Indigo");
        addColor(6, "Violet");
    }

    function addColor(uint index, string memory color) public {
        colors[index] = color;
    }

    function getColor(uint index) public view returns (string memory) {
        return colors[index];
    }

    function getAllColors() public view returns (string[] memory) {
        string[] memory allColors = new string[](7);
        for (uint i = 0; i < 7; i++) {
            allColors[i] = colors[i];
        }
        return allColors;
    }

    function colorExists(uint index) public view returns (bool) {
        return bytes(colors[index]).length > 0;
    }

    function removeColor(uint index) public onlyOwner {
        delete colors[index];
    }
}
