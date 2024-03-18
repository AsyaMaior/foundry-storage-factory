//SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {StorageFactory} from "../src/StorageFactory.sol";

contract DeployStorageFactory is Script {
    function run() external returns (StorageFactory storageFactory) {
        vm.startBroadcast();
        storageFactory = new StorageFactory();
        vm.stopBroadcast();
    }
}
