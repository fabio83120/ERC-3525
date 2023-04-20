// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@solvprotocol/erc-3525/ERC3525.sol";

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Villa_Grasse is ERC3525 {
     using Strings for uint256;

    address public owner;

    constructor(address owner_) ERC3525("Villa_Grasse", "Villa_Grasse", 18) {
        owner = owner_;
    }

    function mint(address to_, uint256 slot_, uint256 amount_) external {
        require(msg.sender == owner, "Villa_Grasse: only owner can mint");
        _mint(to_, slot_, amount_);
    }

     function tokenURI(uint256 tokenId_) public view virtual override returns (string memory) {
        return string(
            abi.encodePacked(
                'https://www.myhomeshare.fr/theme-assets/images/',tokenId_.toString(),".png"
                
            )
        );
     }
}
