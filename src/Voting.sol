// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Voting {

    // The address of central authority entity which grants other entities the right to vote i.e. mints them a VoterNFT
    address private centralAuthorityAddress;
    
    constructor(address centralAuthority) {
        centralAuthorityAddress = centralAuthority;
    }
}
