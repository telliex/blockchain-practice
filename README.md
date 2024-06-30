# MyToken - Blockchain Practice

## Introduction

MyToken is a simple ERC20 token implementation on the Ethereum blockchain. This project is a practice to understand blockchain development, smart contract deployment, and interaction with a front-end application using Web3.js and React.

## Features

- ERC20 standard token implementation
- Minting of initial supply
- Transfer tokens between accounts
- Approve and transfer tokens on behalf of another account

## Prerequisites

- [Node.js](https://nodejs.org/) (v12 or higher)
- [npm](https://www.npmjs.com/) (v6 or higher)
- [Truffle](https://www.trufflesuite.com/truffle) (v5 or higher)
- [Ganache](https://www.trufflesuite.com/ganache) (CLI or GUI)
- [MetaMask](https://metamask.io/) browser extension

## Installation

### Clone the repository

```bash
git clone https://github.com/yourusername/MyToken.git
cd MyToken
```

### Install dependencies

```bash
npm install
```

Install Truffle globally

```bash
npm install -g truffle
```

Start Ganache

Start Ganache CLI (default :8545) or Ganache GUI (default :7545). Make sure it is running on <http://127.0.0.1:8545> or <http://127.0.0.1:7545>.

### Compile and Deploy the Smart Contract

Compile the smart contract

```bash
truffle compile
```

You will get a `build` folder  which contains the ABI .

Deploy the smart contract

```bash
truffle migrate 
```

You will get a contract address. The whole information as below

```bash
Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.


Starting migrations...
======================
> Network name:    'development'
> Network id:      5777
> Block gas limit: 6721975 (0x6691b7)


2_deploy_contracts.js
=====================

   Deploying 'MyToken'
   -------------------
   > transaction hash:    0x93c9e475e50608cd9105f5b61a89a79b845b1b8530e72fa4980274d37a389f04
   > Blocks: 0            Seconds: 0
   > contract address:    0x0e729b5dAbe6067c4C764b85eE466A4158660B4b
   > block number:        12
   > block timestamp:     1719775319
   > account:             0x116a04DcB24A6D2CA595162D246c6ED087264050
   > balance:             99.992114701522843182
   > gas used:            962038 (0xeadf6)
   > gas price:           2.715621142 gwei
   > value sent:          0 ETH
   > total cost:          0.002612530732207396 ETH

   > Saving artifacts
   -------------------------------------
   > Total cost:     0.002612530732207396 ETH

Summary
=======
> Total deployments:   1
> Final cost:          0.002612530732207396 ETH
```

### Deploy the Smart Contract

Compile the smart contract

```bash
truffle compile
```
  
`

Deploy the smart contract

```bash
truffle migrate --network ganache
```

## Usage

### Create a new MetaMask account

Open MetaMask and click the "Add Network" button.

![Add Network](./images/add-network.png)

Enter the following information:

- Network Name: Ganache

### Interact with the Smart Contract

You can interact with the deployed contract using the Truffle console.

```bash
truffle console
```

In the console, you can run commands like:

```bash
let instance = await MyToken.deployed();
let accounts = await web3.eth.getAccounts();
let balance = await instance.balanceOf(accounts[0]);
console.log(balance.toString());

```

## Project Structure

```bash
blockchain-practice/
├── client/                 # Frontend application
│   ├── src/
│   │   ├── App.js          # Main React component
│   │   ├── web3.js         # Web3 configuration
│   │   └── MyToken.js      # Smart contract interaction
│   ├── public/
│   └── package.json
├── contracts/              # Smart contracts
│   └── MyToken.sol         # ERC20 Token contract
├── migrations/             # Deployment scripts
│   └── 2_deploy_contracts.js
├── test/                   # Test scripts
├── build/                  # Compiled contract artifacts
├── truffle-config.js       # Truffle configuration
└── package.json

```

## License

This project is licensed under the MIT [License](https://chatgpt.com/c/LICENSE) - see the LICENSE file for details.

## Acknowledgments

Acknowledgments

- [OpenZeppelin](https://openzeppelin.com/) for their ERC20 implementation
- [Truffle Suite](https://www.trufflesuite.com/) for the development framework
- [MetaMask](https://metamask.io/) for the Ethereum wallet and browser extension
- Ganache for the personal blockchain

## Somethings that you need to know

keep the version number

```bash
// MyToken.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

```

```bash
// truffle-config.js


```bash
  compilers: {
    solc: {
      version: "0.8.26", 
      settings: {
        // See the solidity docs for advice about optimization and evmVersion
        optimizer: {
          enabled: false,
          runs: 200,
        },
        evmVersion: "byzantium",
      },
    },
  },
```
