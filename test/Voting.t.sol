// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Voting} from "../src/Voting.sol";

contract CounterTest is Test {
    Voting public votingContract;

    function setUp() public {
        // votingContract = new Voting();
    }

    function test_Increment() public {
    }

    function testFuzz_SetNumber(uint256 x) public {
    }
}
