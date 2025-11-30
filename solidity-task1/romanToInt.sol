// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RomanToInt {
    mapping(bytes1 => uint) private symbolValue;

    constructor() {
        symbolValue["I"] = 1;
        symbolValue["V"] = 5;
        symbolValue["X"] = 10;
        symbolValue["L"] = 50;
        symbolValue["C"] = 100;
        symbolValue["D"] = 500;
        symbolValue["M"] = 1000;
    }

    function romanToInt(string memory s) public view returns (uint) {
        bytes memory str = bytes(s);
        uint len = str.length;
        uint ans = 0;

        for (uint i = 0; i < len; i++) {
            uint currentVal = symbolValue[str[i]];

            if (i < len - 1 && currentVal < symbolValue[str[i + 1]]) {
                ans -= currentVal;
            } else {
                ans += currentVal;
            }
        }
        return ans;

    }
}