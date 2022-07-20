// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

import {IERC721} from "src/interfaces/IERC721.sol";

/// @title OpWrap
/// @author asnared <https://github.com/abigger87>
/// @notice Batches Calls to an ERC721 Contract
contract OpWrap {

  /// @notice The Optimism Token
  IERC721 public token;

  /// @notice The Owner
  address public owner;

  /// @notice Thrown when an unauthorized caller makes a call to this contract
  error Unauthorized();

  /// @notice Instantiate the Batcher
  constructor(IERC721 _token, address _owner) {
    token = _token;
    owner = _owner;
  }

  /// @notice Returns if one of the given addresses is a token owner.
  function areOwners(address[] memory potentialOwners) public view returns (bool) {
    uint256 length = potentialOwners.length;
    uint256 i;
    for (i = 0; i < length;) {
      if (potentialOwners[i] != address(0) && token.balanceOf(potentialOwners[i]) > 0) return true;
      unchecked { ++i; }
    }
    return false;
  }

  /// @notice Allows the owner to set the token.
  function setToken(IERC721 newToken) external {
    if (msg.sender != owner) revert Unauthorized();
    token = newToken;
  }

  /// @notice Allows the owner to set a new owner.
  function setOwner(address newOwner) external {
    if (msg.sender != owner) revert Unauthorized();
    owner = newOwner;
  }
}
