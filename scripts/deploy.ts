import { ethers } from "hardhat";
require("dotenv").config({ path: ".env" });

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("🚀 ~ main ~ deployer:", deployer.address);

  const buzorToken = await ethers.deployContract(
    "OrganizationRegistration",
    []
  );

  await buzorToken.waitForDeployment();

  const buzorTokenAddress = buzorToken.getAddress();

  console.log(`Buzor Token deployed to ${buzorToken.target}`);

  const orgRegistry = await ethers.deployContract("OrganizationRegistration");

  await orgRegistry.waitForDeployment();

  console.log(`OrgRegistry deployed to ${orgRegistry.target}`);

  const orgRegistryAddress = orgRegistry.getAddress();
  const vesting = await ethers.deployContract("Vesting", [
    buzorTokenAddress,
    orgRegistryAddress,
    deployer,
  ]);

  await vesting.waitForDeployment();

  console.log(`Vesting deployed to ${vesting.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
