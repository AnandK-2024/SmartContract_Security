// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract MY {
    uint256 public count = 789;
    address private Owner;
    bool public isTrue = true;
    uint64 value = 64;
    bytes32 private Owner_password;
    uint256 public immutable const_value = 898987;
    struct User {
        uint256 id;
        bytes32 password;
        address myaddress;
    }
    uint16[3] public array;
    User[] private history;
    mapping(address => User) private idToUser;

    constructor(bytes32 _password) {
        Owner_password = _password;
        Owner = msg.sender;
    }

    function addUser(bytes32 _password) public {
        User memory temp = User(history.length, _password, msg.sender);
        history.push(temp);
        idToUser[msg.sender] = temp;
    }
}
