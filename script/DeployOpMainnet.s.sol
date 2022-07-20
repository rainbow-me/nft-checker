// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

import {OpWrap} from "src/OpWrap.sol";
import {IERC721} from "src/interfaces/IERC721.sol";

import {Script} from 'forge-std/Script.sol';

/// @title Deploy Optimism Mainnet
contract DeployOpMainnet is Script {
  address constant OPTIMISM_NFT = 0x81b30ff521D1fEB67EDE32db726D95714eb00637;
  address constant OWNER = 0x0c36A5b01E1668C867A5e58f23bb6cb4d83a4cc8;

  function run() external returns (OpWrap wrapper) {
    vm.startBroadcast();
    wrapper = new OpWrap(IERC721(OPTIMISM_NFT), OWNER);
    vm.stopBroadcast();
  }
}
