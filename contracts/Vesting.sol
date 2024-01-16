// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./OrgRegistry.sol";
// Contract for managing vesting details and token distribution

contract Vesting is Ownable {
    IERC20 public token;
    OrganizationRegistration public OrgRegistry;

    modifier onlyStakeholder(address _stakeholder) {
        require(msg.sender == _stakeholder, "Only stakeholder can call this function");
        _;
    }

    constructor(address _token, address _orgRegistryAddress, address _initialOwner) Ownable(_initialOwner) {
        token = IERC20(_token);
        OrgRegistry = OrganizationRegistration(_orgRegistryAddress);
    }

    function withdrawTokens() external onlyStakeholder(msg.sender) {
        address stakeholder = msg.sender;
        address org = owner();

        (uint256 vestingPeriod, uint256 startTime, bool whitelisted) = OrgRegistry.getVestingDetails(org, stakeholder);

        require(vestingPeriod > 0, "Stakeholder not found");
        require(block.timestamp >= startTime + vestingPeriod, "Vesting period not completed");
        require(whitelisted, "Stakeholder not whitelisted");

        uint256 balance = token.balanceOf(address(this));
        require(balance > 0, "No tokens to withdraw");

        token.transfer(stakeholder, balance);
    }
}
