import { ethers } from "hardhat";

async function main() {
  const VotingPollFactory = await ethers.deployContract("VotingPollFactory");
  await VotingPollFactory.waitForDeployment();

  console.log(
    `VotingPollFactory  contract deployed to ${VotingPollFactory.target}`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
