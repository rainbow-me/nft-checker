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

    // VM Cheatcodes can be found in ./lib/forge-std/src/Vm.sol
    // Or at https://github.com/foundry-rs/forge-std
    function testSetGm() public {
        greeter.setGm("gm gm");

        // Expect the GMEverybodyGM event to be fired
        vm.expectEmit(true, true, true, true);
        emit GMEverybodyGM();
        greeter.gm("gm gm");

        // Expect the gm() call to revert
        vm.expectRevert(abi.encodeWithSignature("BadGm()"));
        greeter.gm("gm");

        // We can read slots directly
        uint256 slot = stdstore.target(address(greeter)).sig(greeter.owner.selector).find();
        assertEq(slot, 1);
        bytes32 owner = vm.load(address(greeter), bytes32(slot));
        assertEq(address(this), address(uint160(uint256(owner))));

        console.log(unicode"✅ good morning tests passed!");
    }

    // Standard Errors can be found in ./lib/forge-std/src/Test.sol
    // Or at https://github.com/foundry-rs/forge-std
    function testExpectArithmetic() public {
        vm.expectRevert(stdError.arithmeticError);
        test.arithmeticError(10);
    }
}

contract ErrorsTest {
    function arithmeticError(uint256 a) external pure {
        a - 100;
    }
}