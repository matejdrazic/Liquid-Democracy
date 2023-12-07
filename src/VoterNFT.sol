// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "solmate/src/tokens/ERC721.sol";

contract VoterNFT is ERC721 {

    error NoAccess();
    error VoterAlreadyRegistered();
    error AddressNotRegisteredForVoting();

    // Address of central authority entity which grants other entities the right to vote i.e. mints them a VoterNFT
    address private centralAuthorityAddress;

    // Mapping of addresses of registered voters to their registration status
    mapping(address => bool) private registeredVoters;



    /****************************************************
                        MODIFIERS
     ****************************************************/

    modifier onlyCentralAuthority(address sender) {
        if(sender != centralAuthorityAddress) {
            revert NoAccess();
        }
        _;   
    }

    modifier canVote(address sender) {
        if(!registeredVoters[sender]) {
            revert AddressNotRegisteredForVoting();
        }
        _;   
    }
 
    constructor(address centralAuthority) ERC721("VoterNFT", "VOTER") {
        centralAuthorityAddress = centralAuthority;
    }

    function mint(address to, uint256 tokenId) public onlyCentralAuthority(msg.sender) {
        if(registeredVoters[to]) {
            revert VoterAlreadyRegistered();
        }
        _mint(to, tokenId);
        registeredVoters[to] = true;
    }

    function tokenURI(uint256 /* id */) public pure override returns (string memory) {
        return "";
    }
}