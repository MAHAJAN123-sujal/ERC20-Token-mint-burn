// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyERC20Token is ERC20{
 
 address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender;
        uint256 initialSupply = 10000* 10**18;
        _mint(msg.sender, initialSupply); 
    }

    function mintToken(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burnToken(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
