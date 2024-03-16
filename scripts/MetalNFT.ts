import { ethers } from "hardhat";

async function main() {
  const deployMetalNFT = await ethers.deployContract("MetalNFT");

  await deployMetalNFT.waitForDeployment();

  console.log(
    `SaveEther Contract Deployed To Address: ${deployMetalNFT.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
