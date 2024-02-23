import { ethers } from "hardhat";

async function main() {
  const deploySaver = await ethers.deployContract("SaveEther");

  await deploySaver.waitForDeployment();

  console.log(`SaveEther Contract Deployed To Address: ${deploySaver.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
