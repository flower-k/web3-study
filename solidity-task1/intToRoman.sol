// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntToRoman {
    mapping (uint => bytes) private symbolValue;
    uint[] private arrValue = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];

    constructor() {
        symbolValue[1000] = "M";
        symbolValue[900] = "CM";
        symbolValue[500] = "D";
        symbolValue[400] = "CD";
        symbolValue[100] = "C";
        symbolValue[90] = "XC";
        symbolValue[50] = "L";
        symbolValue[40] = "XL";
        symbolValue[10] = "X";
        symbolValue[9] = "IX";
        symbolValue[5] = "V";
        symbolValue[4] = "IV";
        symbolValue[1] = "I";
    }

    function intToRoman(uint num) public view returns (string memory) {
        require(num > 0 && num < 4000, "Number out of range(1-3999)");
        uint len = arrValue.length;
        bytes memory roman;
        for (uint i = 0; i < len; i++) {
            while (num >= arrValue[i]) {
                roman = bytes.concat(roman, symbolValue[arrValue[i]]);
                num -= arrValue[i];
            }
            if (num == 0) {
                break;
            }
        }
        return string(roman);
    }
}