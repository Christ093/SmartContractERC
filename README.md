# Degen (DGN) ERC-20 Token

This repository contains the smart contract for the **Degen** ERC-20 token, with the symbol **DGN**. It is designed to be used in a game platform where players can earn tokens as rewards, transfer them to others, redeem them for items, and burn them when no longer needed.

## Features

- **ERC-20 Compliant**: The contract follows the ERC-20 standard, ensuring compatibility with wallets, exchanges, and other platforms.
- **Minting**: The owner can mint new tokens and distribute them as rewards to players.
- **Transferring Tokens**: Players can transfer tokens to other players.
- **Redeeming Tokens**: Players can redeem their tokens for items in the in-game store. Tokens are burned after redemption.
- **Burning Tokens**: Players can burn tokens that they own if they no longer need them.
- **Checking Token Balance**: Players can check their token balance at any time.

## Contract Overview

- **Name**: Degen
- **Symbol**: DGN
- **Decimals**: 18 (default for ERC-20 tokens)
- **Owner**: The address that deploys the contract is the owner by default.
- **Initial Supply**: The initial supply is minted during deployment and assigned to the deployer's address.

## Contract Functions

1. **constructor(uint256 _initialSupply)**
   - Initializes the token with the name "Degen", the symbol "DGN", and mints an initial supply of tokens to the deployer's address.

2. **mint(address to, uint256 amount)**
   - **Only the owner** can mint new tokens to a specified address. This function is used to reward players.
   - Emits a `Mint` event when new tokens are minted.

3. **transfer(address recipient, uint256 amount)**
   - Allows players to transfer tokens to another player. This follows the standard ERC-20 transfer function.

4. **redeem(uint256 amount)**
   - Players can redeem their tokens for in-game items. Upon redemption, the tokens are burned.
   - Emits a `Redeem` event when tokens are redeemed.

5. **burn(uint256 amount)**
   - Players can burn their own tokens when they no longer need them. This reduces the total supply.
   - Emits a `Burn` event when tokens are burned.

6. **balanceOf(address account)**
   - Allows players to check their current token balance. This function is inherited from the ERC-20 standard.

7. **transferOwnership(address newOwner)**
   - Allows the current owner to transfer ownership of the contract to a new address.

## Deployment Instructions

1. **Compile the Contract**
   - Compile the contract using a Solidity compiler (e.g., Remix IDE or Truffle).
   
2. **Deploy the Contract**
   - Deploy the contract to an Ethereum network (testnet).
   - Provide the initial supply in the constructor. 
