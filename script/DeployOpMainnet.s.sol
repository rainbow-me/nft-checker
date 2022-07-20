// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

import {OpWrap} from "src/OpWrap.sol";
import {IERC721} from "src/interfaces/IERC721.sol";

import {Script} from 'forge-std/Script.sol';

/// @title Deploy Optimism Mainnet
contract DeployOpMainnet is Script {
  address constant OPTIMISM_NFT = 0x81b30ff521D1fEB67EDE32db726D95714eb00637;
  address constant OWNER = 0xc9AB63915c6738c8Ce5ca245979203Bfa3F2499F;

  function run() external returns (OpWrap wrapper) {
    vm.startBroadcast();
    wrapper = new OpWrap(IERC721(OPTIMISM_NFT), OWNER);
    vm.stopBroadcast();
  }
}
