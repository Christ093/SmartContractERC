# SmartContractERC

`MyToken` is a custom ERC20 token contract built using Solidity and OpenZeppelin’s ERC20 implementation. The token includes features for minting new tokens, burning existing tokens, and has an owner-only access modifier for specific functions.

## Features

1. **Minting**: The contract owner can mint new tokens and send them to any address.
2. **Burning**: Any user can burn (destroy) their own tokens, reducing the total supply.
3. **Owner-only functions**: Certain actions, such as minting new tokens, are restricted to the contract's owner.

## Contract Structure

- **ERC20**: The contract inherits from OpenZeppelin's `ERC20` standard, which provides standard functions like `transfer`, `balanceOf`, `approve`, etc.

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

This function allows the owner to mint new tokens and send them to a specified address. Minting is limited to the contract owner.

### `burn(uint256 amount)` 

```solidity
function burn(uint256 amount) public
```
- **Parameters**:
  - `amount`: The number of tokens to burn from the sender’s address.
- **Access**: Any user can burn tokens from their own balance.

This function allows any user to burn (destroy) their own tokens, reducing the total supply. The action is logged with a `Burn` event.

### `transfer(address to, uint256 amount)`

```solidity
function transfer(address to, uint256 amount) public override returns (bool)
```
- **Parameters**:
  - `to`: The address to which the tokens will be transferred.
  - `amount`: The number of tokens to transfer.
- **Access**: Public function accessible to all users.

This function allows users to transfer tokens from their address to another address. It overrides the standard `ERC20` transfer function from OpenZeppelin.

### `approve(address spender, uint256 amount)`

```solidity
function approve(address spender, uint256 amount) public override returns (bool)
```
- **Parameters**:
  - `spender`: The address that will be allowed to spend tokens from the caller's balance.
  - `amount`: The amount of tokens that the spender is allowed to transfer.
- **Access**: Public function accessible to all users.

This function allows a user to approve a third party (spender) to spend a certain amount of tokens on their behalf.

### `transferFrom(address from, address to, uint256 amount)`

```solidity
function transferFrom(address from, address to, uint256 amount) public override returns (bool)
```
- **Parameters**:
  - `from`: The address from which tokens will be transferred.
  - `to`: The recipient address.
  - `amount`: The number of tokens to transfer.
- **Access**: Public function accessible to all users.

This function allows a third party (who has been approved) to transfer tokens from the `from` address to the `to` address.

## Events

### `Burn(address indexed from, uint256 value)`

This event is emitted whenever tokens are burned. It includes:
- `from`: The address from which the tokens were burned.
- `value`: The number of tokens burned.

## Deployment and Usage

### 1. Deploy the contract:
1. Copy the contract code into Remix IDE.
2. Compile the contract using the Solidity compiler in Remix.
3. Deploy the contract to the Remix VM or an Ethereum test network.
4. After deployment, interact with the contract functions from the **Deployed Contracts** section.

### 2. Interacting with the contract
Once deployed, you can interact with the contract by calling the available functions:
- **Minting**: Use the `mint` function to mint new tokens (only available to the contract owner).
- **Burning**: Use the `burn` function to destroy tokens from your own balance.
- **Transferring**: Use `transfer` to send tokens to another address.

### 3. Only Owner Functions
Only the contract owner can call the `mint` function. If you are not the owner, you will get an error when trying to call owner-only functions like `mint`.
