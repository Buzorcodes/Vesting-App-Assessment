
# Vesting Contract

This repository contains three Solidity contracts:  `BuzorToken`,  `OrganizationRegistration`, and  `Vesting`. These contracts are designed to manage a token called Buzor (BUT), handle organization registration and stakeholders, and manage vesting details and token distribution.

## BuzorToken

The  `BuzorToken`  contract is an implementation of an ERC20 token. It includes functions for transferring tokens (`transfer`), approving others to spend tokens on behalf of the holder (`approve`), transferring tokens from one account to another (`transferFrom`), minting new tokens (`mint`), and burning existing tokens (`burn`).

`contract  BuzorToken  {   // ...  }` 

## OrganizationRegistration

The  `OrganizationRegistration`  contract allows for the registration of organizations and the addition of stakeholders. It also provides functionality to retrieve vesting details for a given stakeholder within an organization.

`contract  OrganizationRegistration  {   // ...  }` 

## Vesting

The  `Vesting`  contract manages vesting details and token distribution. It allows stakeholders to withdraw their tokens once they have vested.

`contract  Vesting  {   // ...  }` 

## Installation and Setup

To interact with these contracts, you will need to set up a development environment. You can use tools like Truffle or Hardhat for compiling and deploying your contracts. Additionally, you may want to use libraries such as ethers.js or web3.js for interacting with your contracts from a JavaScript application.

## Testing

It's crucial to thoroughly test your contracts to ensure they behave as expected. You can write tests using a framework like Mocha or Jest, and run them against a local Ethereum network provided by Ganache or Hardhat Network.

## Deployment

Once you're satisfied with your contracts and their tests, you can compile them and deploy them to a live network. Be sure to thoroughly test your contracts in a live environment before relying on them for any significant transactions.

Please note that these contracts are written in Solidity version 0.8.17 and 0.8.18. Always make sure to keep your compiler version updated and compatible with the features used in your contracts.