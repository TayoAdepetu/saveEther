import { ethers } from "hardhat";

async function main() {
  const contractWallet = "0xE09cD95bf04b39f5CF0ac15AA13a740918F13f9c";
  const getSaveEther = await ethers.getContractAt("SaveEther", contractWallet);

  const amount = ethers.parseEther("0.4");
  const receiver = "0x2F23127369638E1AD462FEe695a549BF80260ACA";

  const depositEther = await getSaveEther.deposit({ value: amount });
  await depositEther.wait();

  const checkSavings = await getSaveEther.checkSavings(receiver);

  console.log(checkSavings);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
