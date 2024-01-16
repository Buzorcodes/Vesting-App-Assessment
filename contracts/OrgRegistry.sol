// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Contract to register organizations and add stakeholders
contract OrganizationRegistration {
    address public owner;

    struct VestingDetails {
        uint256 vestingPeriod;
        uint256 startTime;
        bool whitelisted;
    }

    struct Organization {
        string name;
        address tokenContract;
        mapping(address => VestingDetails) stakeholders;
    }

    mapping(address => Organization) public organizations;

    event OrganizationRegistered(address indexed orgAddress, string name, address tokenContract);
    event StakeholderAdded(
        address indexed orgAddress, address indexed stakeholder, uint256 vestingPeriod, bool whitelisted
    );

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerOrganization(string memory _name, address _tokenContract) external onlyOwner {
        organizations[msg.sender].name = _name;
        organizations[msg.sender].tokenContract = _tokenContract;

        emit OrganizationRegistered(msg.sender, _name, _tokenContract);
    }

    function addStakeholder(address _stakeholder, uint256 _vestingPeriod, bool _whitelisted) external onlyOwner {
        require(organizations[msg.sender].stakeholders[_stakeholder].vestingPeriod == 0, "Stakeholder already added");

        organizations[msg.sender].stakeholders[_stakeholder] =
            VestingDetails({vestingPeriod: _vestingPeriod, startTime: block.timestamp, whitelisted: _whitelisted});

        emit StakeholderAdded(msg.sender, _stakeholder, _vestingPeriod, _whitelisted);
    }

    function getVestingDetails(address _org, address _stakeholder) external view returns (uint256, uint256, bool) {
        return (
            organizations[_org].stakeholders[_stakeholder].vestingPeriod,
            organizations[_org].stakeholders[_stakeholder].startTime,
            organizations[_org].stakeholders[_stakeholder].whitelisted
        );
    }
}
