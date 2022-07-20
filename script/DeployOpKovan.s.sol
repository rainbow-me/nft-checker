// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

import {OpWrap} from "src/OpWrap.sol";
import {IERC721} from "src/interfaces/IERC721.sol";

import {Script} from 'forge-std/Script.sol';

/// @title Deploy Optimism Kovan
contract DeployOpKovan is Script {
  address constant OPTIMISM_NFT = 0x58AcA48312f44C2f8215E5FBa67078Fb0cfd45bA;
  address constant OWNER = 0x0c36A5b01E1668C867A5e58f23bb6cb4d83a4cc8;

  function run() external returns (OpWrap wrapper) {
    vm.startBroadcast();
    wrapper = new OpWrap(IERC721(OPTIMISM_NFT), OWNER);
    vm.stopBroadcast();
  }
}