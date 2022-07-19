// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

/// @title ERC165 Interface
/// @author Modified from openzeppelin-contracts <
/// @notice Interface of the ERC165 standard.
/// @notice https://eips.ethereum.org/EIPS/eip-165[EIP].
interface IERC165 {
    /// @notice Returns true if this contract implements the interface defined by `interfaceId`
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}
