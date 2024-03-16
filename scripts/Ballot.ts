import { ethers } from "hardhat";
const hre = require("hardhat");

async function main() {
  const proposedNames = [
    hre.ethers.utils.formatBytes32String("Proposal 1"),
    hre.ethers.utils.formatBytes32String("Proposal 2"),
    hre.ethers.utils.formatBytes32String("Proposal 3"),
  ];
  const deployBallot = await ethers.deployContract("Ballot", [proposedNames]);

  await deployBallot.waitForDeployment();

  console.log(`Ballot Contract Deployed To Address: ${deployBallot.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
