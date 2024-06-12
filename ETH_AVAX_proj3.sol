// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyERC20Token is ERC20 {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender;
        uint256 initialSupply = 10000 * 10**uint(decimals());
        _mint(msg.sender, initialSupply);
    }

    function MyMintToken(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function MyBurnToken(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function decimals() public view virtual override returns (uint8) {
        return 0; // Return 0 if you don't want any decimal places
    }

    function MyTransferTokens(address to, uint256 amount) public returns (bool) {
        require(to != address(0), "Transfer to the zero address");
        require(balanceOf(msg.sender) >= amount, "Transfer amount exceeds balance");

        // Perform the transfer
        _transfer(msg.sender, to, amount);
        return true;
    }
}
