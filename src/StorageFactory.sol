//SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    error MoreThenOneContract();

    SimpleStorage[] public listOfSimpleStorages;
    mapping(address creator => uint256 index) public indexOfSimpleStorage;


    constructor() {
        // plug for slot 0
        listOfSimpleStorages.push(SimpleStorage(address(0)));
    }

    function createSimpleStorage() external {
        if (indexOfSimpleStorage[msg.sender] != 0) revert MoreThenOneContract();

        SimpleStorage newSimpleStorage = new SimpleStorage(address(this));

        listOfSimpleStorages.push(newSimpleStorage);
        indexOfSimpleStorage[msg.sender] = listOfSimpleStorages.length - 1;
    }

    function exStore(uint256 newNumber) external {
        SimpleStorage mySimpleStorage = listOfSimpleStorages[
            indexOfSimpleStorage[msg.sender]
        ];
        mySimpleStorage.store(newNumber);
    }

    function exRetrieve(
        uint256 index
    ) public view returns (uint256 favouriteNumber) {
        favouriteNumber = listOfSimpleStorages[index].retrieve();
    }

    function getMyContract() external view returns(address) {
        uint256 index = indexOfSimpleStorage[msg.sender];
        return address(listOfSimpleStorages[index]);
    } 

    function getMyFavouriteNumber() external view returns(uint256) {
        uint256 index = indexOfSimpleStorage[msg.sender];
        return exRetrieve(index);
    }
}
