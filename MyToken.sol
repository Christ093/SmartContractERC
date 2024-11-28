// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

// Import the ERC20 contract from OpenZeppelin library
import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 

// Define the contract for the token, inheriting from ERC20
contract MyToken is ERC20 {
    address public owner;

    // Events to log transfers and burns
    event Burn(address indexed from, uint256 value);

    // Constructor to initialize the token
    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) ERC20(_name, _symbol) {
        _mint(msg.sender, _initialSupply); // Mint initial supply to the deployer
        owner = msg.sender; // Set the owner as the deployer
    }

    // Modifier to restrict certain actions to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _; // This allows the function's code to run if the modifier condition is met
    }

    // Function to mint new tokens. Only callable by the owner
    function mint(address to, uint256 amount) public onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        _mint(to, amount); // Mint new tokens to the recipient
    }

    // Function to burn tokens (reduce supply)
    function burn(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to burn");
        _burn(msg.sender, amount); // Burn tokens from the sender
        emit Burn(msg.sender, amount); // Log the burn event
    }

    // Optional function to transfer ownership
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        owner = newOwner;
    }
}
