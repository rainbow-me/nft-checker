// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

import {OpWrap} from "src/OpWrap.sol";
import {IERC721} from "src/interfaces/IERC721.sol";

import {Test} from "forge-std/Test.sol";
import {MockERC721} from "solmate/test/utils/mocks/MockERC721.sol";

contract OpWrapTest is Test {
    OpWrap wrapper;
    MockERC721 token;
    address OWNER = address(0x1337);

    /// @notice Set up the testing suite
    function setUp() public {
        // Deploy a mock Optimism NFT
        token = new MockERC721("Token", "TKN");

        // Deploy the wrapper
        wrapper = new OpWrap(IERC721(address(token)), OWNER);
    }

    /// @notice Test the wrapper setup
    function testSetup() public {
        assertEq(address(wrapper.token()), address(token));
        assertEq(wrapper.owner(), OWNER);
    }

    /// @notice Test the areOwners function
    function testAreOwnersLast(address[] memory potentialOwners) public {
        // Non-owners should not be owners
        assertEq(wrapper.areOwners(potentialOwners), false);

        // Mint the last potential owner a token
        vm.assume(potentialOwners.length > 0);
        vm.assume(potentialOwners[potentialOwners.length - 1] != address(0));
        token.mint(potentialOwners[potentialOwners.length - 1], 1);
        assertEq(wrapper.areOwners(potentialOwners), true);
    }

    /// @notice Test the areOwners function
    function testAreOwnersFirst(address[] memory potentialOwners) public {
        // Non-owners should not be owners
        assertEq(wrapper.areOwners(potentialOwners), false);

        // Mint the last potential owner a token
        vm.assume(potentialOwners.length > 0);
        vm.assume(potentialOwners[0] != address(0));
        token.mint(potentialOwners[0], 1);
        assertEq(wrapper.areOwners(potentialOwners), true);
    }

    /// @notice Test setting the token
    function testSetToken(address caller) public {
        vm.assume(caller != OWNER);

        // Non-owner can't set the token
        vm.startPrank(caller);
        vm.expectRevert(abi.encodeWithSignature("Unauthorized()"));
        wrapper.setToken(IERC721(caller));
        vm.stopPrank();
        assertEq(address(wrapper.token()), address(token));

        // Owner can set the token
        vm.startPrank(OWNER);
        wrapper.setToken(IERC721(caller));
        assertEq(address(wrapper.token()), caller);
        wrapper.setToken(IERC721(address(token)));
        vm.stopPrank();
    }

    /// @notice Test setting the owner
    function testSetOwner(address caller) public {
        vm.assume(caller != OWNER);

        // Non-owner can't set the owner
        vm.startPrank(caller);
        vm.expectRevert(abi.encodeWithSignature("Unauthorized()"));
        wrapper.setOwner(caller);
        vm.stopPrank();
        assertEq(wrapper.owner(), OWNER);

        // Owner can set the token
        vm.startPrank(OWNER);
        wrapper.setOwner(caller);
        assertEq(wrapper.owner(), caller);
        vm.stopPrank();

        // Set the owner back
        vm.startPrank(caller);
        wrapper.setOwner(OWNER);
        assertEq(wrapper.owner(), OWNER);
        vm.stopPrank();
    }
}
