## Payment System Using ERC20 Tokens

This project uses the Ethereum blockchain to construct a payment system contract and a basic ERC20 token. Using ERC20 tokens, the system makes micropayments and remittances easier. You will learn how to deploy and work with the contracts as well as the other parts of the system by following this course.

### Components

1. **ERC20Token Contract**:
   - Provides minting and burning features for a regular ERC20 token.
    - Tokens can be created by the contract owner.
    - Tokens can be burned, transferred, and approved allowances can be granted by users.

2. **PaymentSystem Contract**:
   - Uses the ERC20 token to enable micropayments and remittances.
    - Enables users to send optional messages along with payments to other addresses.
    - Sends out events in order to log them.

### ERC20Token Contract

The `ERC20Token` contract follows the ERC20 standard and includes additional features such as minting and burning tokens. Below is the contract code:

### Deployment and Interaction
Great, let's get started with building your DeFi Empire on Avalanche! Here's a detailed plan to help you set up your EVM subnet, define your native currency, connect to MetaMask, and deploy your foundational smart contracts.

### Step-by-Step Guide

#### 1. Set Up Your EVM Subnet

1. **Install the Avalanche CLI**:
   
## Installation

To install the required dependencies and set up the environment, follow these steps:

1. Install the Avalanche CLI by running the following command:

   ```bash
   curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s

2.Add the Avalanche CLI to your system's PATH by running:

export PATH=~/bin:$PATH

    
      
3. **Create a New EVM Subnet**:
   ```bash
   avalanche subnet create
   ```
   Follow the prompts to name your subnet and configure it.

4. **Deploy the Subnet**:
   ```bash
   avalanche subnet deploy
   ```
   This will set up your custom EVM subnet on the Avalanche network.

#### 2. Define Your Native Currency

1. **Create ERC20 Token Contract**:
   Use Remix IDE to create your ERC20 token contract for the native currency.

2. **Deploy ERC20 Contract**:
   Deploy this contract on your custom EVM subnet using Remix IDE connected to MetaMask.

#### 3. Connect to MetaMask

1. **Add Custom Network to MetaMask**:
   Go to MetaMask and add a custom RPC network using the details from your subnet.

   - Network Name: YourSubnetName
   - New RPC URL: `http://localhost:9650/ext/bc/YOUR_SUBNET/rpc`
   - Chain ID: YourSubnetChainID
   - Currency Symbol: NAT (or your chosen symbol)

2. **Connect MetaMask to Remix**:
   In Remix, select the “Injected Web3” environment to connect to your MetaMask wallet.

#### 4. Deploy Basic Building Blocks

1. **Create Vault Contract**:
   Use Solidity to create a Vault contract for storing tokens. 

2. **Deploy Vault Contract**:
   Deploy this contract on your EVM subnet using Remix IDE.

3. **Develop Game Mechanics**:
   Implement additional contracts for game activities like battling, exploring, and trading. These will use the Vault and ERC20 contracts for various in-game transactions.

### Deployment and Interactions

1. **Deploy ERC20Token**:
   - Use a tool like Remix, Hardhat, or Truffle to deploy the `ERC20Token contract.I will use remix 
    - Set the desired token name, symbol, initial supply, and decimals when the contract is first created.

2.**Deploy PaymentSystem** : 
   - Generate and implement the `PaymentSystem` contract, supplying the address of the `ERC20Token} that has been deployed.

3. **Interact with Contracts**:
   - Transfer tokens, authorize allowances, mint new tokens, and burn existing tokens using the `ERC20Token` methods.
    - Call the `makePayment` and `sendRemittance` functions on the `PaymentSystem` contract to send remittances and make micropayments.

### PaymentSystem Contract

The `PaymentSystem` contract facilitates payments and remittances using the ERC20 token.

### Conclusion

The basic infrastructure needed to create a payment platform with ERC20 tokens is provided by this project. Micropayments and remittances are made possible by the `PaymentSystem` contract, while the `ERC20Token` contract enables token generation and maintenance. Developers can use these contracts to build effective and affordable blockchain payment systems by deploying and interacting with them.
