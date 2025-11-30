// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 创建一个名为Voting的合约，包含以下功能：
// 一个mapping来存储候选人的得票数
// 一个vote函数，允许用户投票给某个候选人
// 一个getVotes函数，返回某个候选人的得票数
// 一个resetVotes函数，重置所有候选人的得票数

contract Voting{
    // 存储候选人得票数
    mapping (address => uint) public votes;
    // 候选人列表
    address[] public userList;
    // 是否已投票
    mapping (address => bool) public hasUser;

    // 投票
    function vote(address user) external {
        require(!hasUser[user], "User Already vote");
        votes[user] += 1;
        userList.push(user);
        hasUser[user] = true;
    }

    // 返回候选人得票数
    function getVotes(address user) external view returns (uint) {
        return votes[user];
    }

    function getAllUsers() external view returns (address[] memory) {
        return userList;
    }

    // 重置所有候选人得票数
    function resetVotes() external {
        uint len = userList.length;
        for (uint i = 0; i < len; i++) {
            delete votes[userList[i]];
            delete hasUser[userList[i]];
        }
        delete userList;
    }
}