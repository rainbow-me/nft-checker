// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.20;

import {NftChecker} from "src/NftChecker.sol";
import {IERC721} from "src/interfaces/IERC721.sol";

import {Test} from "forge-std/Test.sol";
import {MockERC721} from "solmate/test/utils/mocks/MockERC721.sol";
import {MockERC1155} from "solmate/test/utils/mocks/MockERC1155.sol";

contract NftCheckerTest is Test {
    NftChecker instance;
    MockERC721 token1;
    MockERC721 token2;
    MockERC1155 token1155;
    address[] token1Array;
    address[] token2Array;
    address[] token1And2Array;
    address[] token2And1Array;

    /// @notice Set up the testing suite
    function setUp() public {
        // Deploy a mock Optimism NFT
        token1 = new MockERC721("Token", "TKN1");
        token2 = new MockERC721("Token", "TKN2");
        token1155 = new MockERC1155();

        token1Array = [address(token1)];
        token2Array = [address(token2)];
        token1And2Array = [address(token1), address(token2)];
        token2And1Array = [address(token1), address(token2)];

        // Deploy the instance
        instance = new NftChecker();
    }

    /// @notice Test the areOwners function
    function testAreOwnersLast(address[] memory potentialOwners) public {
        // None of the addresses can be zero
        for (uint256 i = 0; i < potentialOwners.length; i++) {
            vm.assume(potentialOwners[i] != address(0));
        }

        // Non-owners should not be owners

        assertEq(instance.areOwners(token1Array, potentialOwners), false);

        // Mint the last potential owner a token
        vm.assume(potentialOwners.length > 0);
        token1.mint(potentialOwners[potentialOwners.length - 1], 1);
        assertEq(instance.areOwners(token1Array, potentialOwners), true);
    }

    /// @notice Test the areOwners function
    function testAreOwnersFirst(address[] memory potentialOwners) public {
        // None of the addresses can be zero
        for (uint256 i = 0; i < potentialOwners.length; i++) {
            vm.assume(potentialOwners[i] != address(0));
        }

        // Mint the last potential owner a token
        vm.assume(potentialOwners.length > 0);
        token1.mint(potentialOwners[0], 1);
        assertEq(instance.areOwners(token1Array, potentialOwners), true);
    }

    function testNotAnOwner(address[] memory potentialOwners) public {
        // None of the addresses can be zero
        for (uint256 i = 0; i < potentialOwners.length; i++) {
            vm.assume(potentialOwners[i] != address(0));
        }

        // Non-owners should not be owners
        assertEq(instance.areOwners(token1Array, potentialOwners), false);
        assertEq(instance.areOwners(token2Array, potentialOwners), false);
        assertEq(instance.areOwners(token1And2Array, potentialOwners), false);
    }

    function testMultipleOwners(address[] memory potentialOwners) public {
        // None of the addresses can be zero
        for (uint256 i = 0; i < potentialOwners.length; i++) {
            vm.assume(potentialOwners[i] != address(0));
        }

        // Check one owner against multiple targets with single ownership
        vm.assume(potentialOwners.length > 0);
        token1.mint(potentialOwners[0], 1);

        assertEq(instance.areOwners(token1And2Array, potentialOwners), true);
        assertEq(instance.areOwners(token2And1Array, potentialOwners), true);

        // Check one owner against multiple targets with multiple ownership
        token2.mint(potentialOwners[0], 1);
        assertEq(instance.areOwners(token1And2Array, potentialOwners), true);
        assertEq(instance.areOwners(token2And1Array, potentialOwners), true);
    }

    function testAreOwnersERC1155(address[] memory potentialOwners) public {
        // None of the addresses can be zero
        for (uint256 i = 0; i < potentialOwners.length; i++) {
            vm.assume(potentialOwners[i] != address(0));
        }

        // Create TokenInfo array with single token
        NftChecker.TokenInfo[] memory tokenInfos = new NftChecker.TokenInfo[](1);
        tokenInfos[0] = NftChecker.TokenInfo({
            account: address(token1155),
            id: 1
        });

        // Initially no one owns tokens
        assertEq(instance.areOwners(tokenInfos, potentialOwners), false);

        // Mint token to first potential owner
        vm.assume(potentialOwners.length > 0);
        token1155.mint(potentialOwners[0], 1, 1, "");
        assertEq(instance.areOwners(tokenInfos, potentialOwners), true);

        // Test with multiple tokens
        NftChecker.TokenInfo[] memory multipleTokens = new NftChecker.TokenInfo[](2);
        multipleTokens[0] = NftChecker.TokenInfo({
            account: address(token1155),
            id: 1
        });
        multipleTokens[1] = NftChecker.TokenInfo({
            account: address(token1155),
            id: 2
        });

        // Should still return true with just first token owned
        assertEq(instance.areOwners(multipleTokens, potentialOwners), true);

        // Mint second token and verify
        token1155.mint(potentialOwners[0], 2, 1, "");
        assertEq(instance.areOwners(multipleTokens, potentialOwners), true);
    }
}
