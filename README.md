### Step 1: Set Up Remix IDE

1. **Go to Remix IDE**:
   - Open [Remix IDE](https://remix.ethereum.org/) in your browser.
   
2. **Create a New File**:
   - In Remix, click on the **File Explorers** panel (on the left side).
   - Click the `+` button to create a new file named `DegenToken.sol`.

3. **Paste the Contract Code**:
   - Copy and paste the `Degen` ERC-20 contract (the one we discussed earlier) into the new `DegenToken.sol` file.

4. **Install OpenZeppelin Contracts**:
   - Remix comes with built-in OpenZeppelin contracts, so you don't need to manually install them.
   - Import the ERC-20 contract by adding the following line at the top of your Solidity file (if not already done):
     ```solidity
     import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
     ```
     
### Step 2: Compile the Contract

1. **Select the Compiler**:
   - In the **Solidity Compiler** tab (on the left side), choose **Solidity Compiler** and make sure the version is set to **0.8.28** or higher (as specified in the contract).
   
2. **Compile the Contract**:
   - Click the **Compile DegenToken.sol** button.
   - If there are no errors, the contract will be compiled successfully.

### Step 3: Deploy the Contract on Avalanche Fuji C-Chain Testnet

#### Setting Up MetaMask for Avalanche Fuji C-Chain Testnet

1. **Install MetaMask**:
   - If you don't have MetaMask installed, go to the [MetaMask website](https://metamask.io/) and install the extension for your browser.
   
2. **Set Up Avalanche Fuji C-Chain Testnet on MetaMask**:
   - Open MetaMask and click on the network dropdown (usually showing "Ethereum Mainnet").
   - Click on **Add Network** and enter the following details for Avalanche Fuji C-Chain:
     - **Network Name**: Avalanche Fuji C-Chain
     - **RPC URL**: `https://api.avax-test.network/ext/bc/C/rpc`
     - **Chain ID**: `43113`
     - **Currency Symbol**: `AVAX`
     - **Block Explorer URL (Optional)**: `https://testnet.snowtrace.io/`

   - Click **Save**.

3. **Get Test AVAX on Fuji**:
   - To deploy on the Avalanche Fuji testnet, you'll need some test AVAX. You can get test AVAX from the [Avalanche Fuji faucet](https://faucet.avax.network/).
   - After adding the Avalanche Fuji network in MetaMask, go to the faucet, enter your MetaMask wallet address, and request test AVAX.

#### Deploying the Contract Using Remix IDE

1. **Connect Remix to MetaMask**:
   - In Remix, go to the **Deploy & Run Transactions** tab (on the left side).
   - Select **Injected Web3** as the environment. This will allow Remix to connect to MetaMask and the Avalanche Fuji C-Chain network.
   - Your MetaMask wallet should prompt you to connect. Approve the connection.

2. **Select the Contract and Constructor Arguments**:
   - In the **Deploy & Run Transactions** tab, select the contract `Degen` from the dropdown.
   - For the **constructor arguments**, enter the initial supply of tokens. 

3. **Deploy the Contract**:
   - Click **Deploy**. MetaMask will ask you to confirm the transaction. After confirmation, the contract will be deployed to the Avalanche Fuji testnet.
   - Once deployed, Remix will show the contract address on the top of the **Deployed Contracts** section.

### Step 4: Interact with the Contract on Snowtrace

1. **View the Contract on Snowtrace**:
   - After deployment, you can view the contract details on the **Snowtrace Testnet**.
   - Go to [Snowtrace Testnet](https://testnet.snowtrace.io/).
   - Search for the contract address that Remix displayed (you can find it in the **Deployed Contracts** section in Remix).
   - You should see your deployed contract’s details.

### Step 5: Additional Interaction via Remix

1. **Mint Tokens**:
   - In Remix, under **Deployed Contracts**, expand the contract and find the `mint` function.
   - Input an address (for the recipient) and the amount of tokens to mint, and click **transact**. MetaMask will prompt for confirmation.
   
2. **Transfer Tokens**:
   - Use the `transfer` function in Remix to send tokens between addresses. Specify the recipient's address and the amount of tokens to transfer.
   
3. **Burn Tokens**:
   - Use the `burn` function to burn tokens from your own address.
   
4. **Redeem Tokens**:
   - Players can redeem tokens by calling the `redeem` function in Remix. This will burn the tokens as part of the redemption process.
