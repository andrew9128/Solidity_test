// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_03 {
    struct Person {
        string name;
        uint8 age;
    }

    Person[] public people; // Массив структур

    function addPerson(string memory _name, uint8 _age) external {
        people.push(Person(_name, _age)); // Добавление новой структуры в массив
    }

    // Функция для получения количества людей
    function getPeopleCount() external view returns (uint) {
        return people.length;
    }

    // Функция, которую нужно реализовать
    function getUser(uint _index) external view returns (string memory, uint8) {
        require(_index < people.length, "Index out of bounds");
        Person memory person = people[_index];
        return (person.name, person.age);
    }
}
