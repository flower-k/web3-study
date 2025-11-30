// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReverseStr {
    function reverse(string memory str) external pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        uint len = strBytes.length;
        bytes memory reverseBytes = new bytes(len);
        for (uint i = 0; i < len; i++) {
            reverseBytes[len - 1 - i] = strBytes[i];
        }
        return string(reverseBytes);
    }
}