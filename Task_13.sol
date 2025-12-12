// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task_13 {
   // Исправлено: != 0
   function assertExample(uint256 _value) public pure {
       assert(_value != 0); 
   }

   // Исправлено: !condition
   function revertExample(bool _condition) public pure {
       if (!_condition) {
           revert("Condition failed!"); 
       }
   }

   // Исправлено: добавлен else
   function ifElseExample(uint256 _value) public pure returns (string memory) {
       if (_value > 10) {
           return "Value is greater than 10";
       } else {
           return "Value is 10 or less";
       }
   }

   // Исправлено: == вместо =
   function elseIfExample(uint256 _value) public pure returns (string memory) {
       if (_value > 10) {
           return "Value is greater than 10";
       } else if (_value == 10) {
           return "Value is exactly 10";
       } else {
           return "Value is less than 10";
       }
   }

   // Исправлено: логика тернарника
   function ternaryExample(uint256 _value) public pure returns (string memory) {
       // if-else эквивалент тернарного
       if (_value > 10) {
           return "Value is greater than 10";
       } else {
           return "Value is 10 or less";
       }
   }
}