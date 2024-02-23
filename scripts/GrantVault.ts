import { ethers } from "hardhat";

async function main() {
  const Vault = await ethers.deployContract("Vault");
  await Vault.waitForDeployment();

  console.log(`Vault  contract deployed to ${Vault.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
