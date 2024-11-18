// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.20;

import {NftChecker} from "src/NftChecker.sol";
import {Script} from "forge-std/Script.sol";

/// @title Deploy Arbitrum One
contract DeployArbOne is Script {
    function run() external returns (NftChecker wrapper) {
        vm.startBroadcast();
        wrapper = new NftChecker();
        vm.stopBroadcast();
    }
}
