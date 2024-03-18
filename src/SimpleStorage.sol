//SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract SimpleStorage {
    error NotAnExecutor();

    uint256 private s_favouriteNumber;
    address private s_executor;

    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    mapping(string name => uint256 favouriteNumber)
        public nameToFavouriteNumber;

    Person[] public listOfPersons;

    constructor(address executor) {
        s_executor = executor;
    }

    function store(uint256 favouriteNumber) external {
        if (msg.sender != s_executor) revert NotAnExecutor();
        s_favouriteNumber = favouriteNumber;
    }

    function retrieve() external view returns (uint256) {
        return s_favouriteNumber;
    }

    function addPersdon(
        uint256 _favouriveNumber,
        string calldata _name
    ) external {
        listOfPersons.push(
            Person({favouriteNumber: _favouriveNumber, name: _name})
        );
        nameToFavouriteNumber[_name] = _favouriveNumber;
    }
}
