import { ethers } from "hardhat";

async function main() {
  const savingTokenAddress = "0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43";
  const deploySaver = await ethers.deployContract("SaveERC20", [
    savingTokenAddress,
  ]);

  await deploySaver.waitForDeployment();

  console.log(`SaveERC20 Contract Deployed To Address: ${deploySaver.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
