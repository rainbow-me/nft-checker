// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.20;

import {IERC721} from "src/interfaces/IERC721.sol";
import {IERC1155} from "src/interfaces/IERC1155.sol";

/// @title NftChecker
/// @author bruno <https://github.com/brunobar79>
/// @author asnared <https://github.com/abigger87>
/// @notice Checks if one of many NFTs are ownerd by any of the given addresses
contract NftChecker {
    /// @notice Returns if one of the given addresses is a token owner.
    function areOwners(address[] memory targets, address[] memory potentialOwners) public view returns (bool) {
        uint256 targetsLength = targets.length;
        uint256 potentialOwnersLength = potentialOwners.length;
        uint256 i;
        uint256 j;
        // for every contract in the targets array
        for (i = 0; i < targetsLength;) {
            // for every address in the potential owners array
            for (j = 0; j < potentialOwnersLength;) {
                // if the potential owner is an actual owner of ERC721
                if (IERC721(targets[i]).balanceOf(potentialOwners[j]) > 0) {
                    return true;
                }
                // if the potential owner is an actual owner of ERC1155
                if (IERC1155(targets[i]).balanceOf(potentialOwners[j], 1) > 0) { // Assuming token ID 1 for ERC1155
                    return true;
                }
                unchecked {
                    ++j;
                }
            }
            unchecked {
                ++i;
            }
        }
        return false;
    }
}
