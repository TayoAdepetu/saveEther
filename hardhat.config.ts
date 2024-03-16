import "@nomicfoundation/hardhat-ethers";
import "@nomicfoundation/hardhat-toolbox";
require("dotenv").config({ path: ".env" });

const ALCHEMY_MAINNET_ETHEREUM_MAINNET_URL =
  process.env.ALCHEMY_MAINNET_ETHEREUM_MAINNET_URL;

const ALCHEMY_MAINNET_POLYGON_MAINNET_URL =
  process.env.ALCHEMY_MAINNET_POLYGON_MAINNET_URL;

const ALCHEMY_SEPOLIA_API_KEY_URL = process.env.ALCHEMY_SEPOLIA_API_KEY_URL;

const ALCHEMY_MUMBAI_API_KEY_URL = process.env.ALCHEMY_MUMBAI_API_KEY_URL;

const ACCOUNT_PRIVATE_KEY = process.env.ACCOUNT_PRIVATE_KEY;

const POLYGONSCAN_API_KEY = process.env.POLYGONSCAN_API_KEY;

module.exports = {
  solidity: "0.8.24",
  networks: {
    hardhat: {
      forking: {
        url: ALCHEMY_MAINNET_ETHEREUM_MAINNET_URL,
      },
    },
    sepolia: {
      url: ALCHEMY_SEPOLIA_API_KEY_URL,
      accounts: [ACCOUNT_PRIVATE_KEY],
    },
    mumbai: {
      url: ALCHEMY_MUMBAI_API_KEY_URL,
      accounts: [ACCOUNT_PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: process.env.POLYGONSCAN_API_KEY,
  },
  lockGasLimit: 200000000000,
  gasPrice: 10000000000,
};
