// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_05 {
    uint256[] public celsiusTemperatures; // storage

    // Функция для добавления температуры в градусах Цельсия
    function addCelsiusTemperature(uint256 temperature) public {
        celsiusTemperatures.push(temperature); // добавляем значение в массив
    }

    // Функция для конвертации градусов Цельсия в Фаренгейт
    function convertToFahrenheit(uint256 temperature) public pure returns (uint256) {
        return (temperature * 9 / 5) + 32; // конвертация
    }

    // Функция для получения всех температур в Фаренгейтах
    function getAllFahrenheitTemperatures() public view returns (uint256[] memory) {
        uint256[] memory fahrenheitTemperatures = new uint256[](celsiusTemperatures.length);
        for (uint256 i = 0; i < celsiusTemperatures.length; i++) {
            fahrenheitTemperatures[i] = convertToFahrenheit(celsiusTemperatures[i]);
        }
        return fahrenheitTemperatures; // возвращаем массив конвертированных температур
    }
}
