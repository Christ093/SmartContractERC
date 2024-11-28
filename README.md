# SmartContractERC

`MyToken` is a custom ERC20 token contract built using Solidity and OpenZeppelin’s ERC20 implementation. The token includes features for minting new tokens, burning existing tokens, and has an owner-only access modifier for specific functions.

## Features

1. **Minting**: The contract owner can mint new tokens and send them to any address.
2. **Burning**: Any user can burn (destroy) their own tokens, reducing the total supply.
3. **Owner-only functions**: Certain actions, such as minting new tokens, are restricted to the contract's owner.

## Contract Structure

- **ERC20**: The contract inherits from OpenZeppelin's `ERC20` standard, which provides standard functions like `transfer`, `balanceOf`, `approve`, etc.
- **Owner**: The contract has an owner (set to the address deploying the contract) who has special permissions, such as minting new tokens.
- **Events**: A `Burn` event is emitted whenever tokens are burned, allowing external systems to track burns.

## Functions

### Constructor

```solidity
constructor(string memory _name, string memory _symbol, uint256 _initialSupply)
```
- **Parameters**:
  - `_name`: Name of the token (e.g., "My Token").
  - `_symbol`: Symbol for the token (e.g., "MTK").
  - `_initialSupply`: The initial amount of tokens to mint and assign to the deployer's address.

This constructor initializes the token’s name, symbol, and mints an initial supply to the contract deployer. It also sets the deployer as the contract owner.

### `mint(address to, uint256 amount)` 

```solidity
function mint(address to, uint256 amount) public onlyOwner
```
- **Parameters**:
  - `to`: The address that will receive the minted tokens.
  - `amount`: The number of tokens to mint.
- **Access**: Only the contract owner can call this function.

This function allows the owner to mint new tokens and send them to a specified address. The minting is limited to the contract owner.

### `burn(uint256 amount)` 

```solidity
function burn(uint256 amount) public
```
- **Parameters**:
  - `amount`: The number of tokens to burn from the sender’s address.
- **Access**: Any user can burn tokens from their own balance.

This function allows users to burn their own tokens, permanently reducing the total supply. The action is logged using a `Burn` event.

## Events

### `Burn(address indexed from, uint256 value)`

This event is emitted whenever tokens are burned. It includes:
- `from`: The address from which the tokens were burned.
- `value`: The number of tokens burned.

## Deployment and Usage

### 1. Deploy the contract
To deploy the contract, you need to use a Solidity-compatible environment like [Remix](https://remix.ethereum.org/), Hardhat, or Truffle. During deployment, you’ll need to specify the token’s name, symbol, and initial supply.

### 2. Interacting with the contract
Once deployed, you can interact with the contract by calling the available functions:
- **Minting**: Use the `mint` function to mint new tokens.
- **Burning**: Use the `burn` function to destroy tokens from your own balance.

### 3. Only Owner Functions
Only the contract owner can call the `mint` function. If you are not the owner, you will get an error when trying to call the owner-only functions.
