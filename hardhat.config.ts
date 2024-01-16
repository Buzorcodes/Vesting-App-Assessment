import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";
dotenv.config();

const ALCHEMY_API_URL = process.env.ALCHEMY_API_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const POLYGON_KEY = process.env.POLYGON_KEY;

const config: HardhatUserConfig = {
  solidity: "0.8.20",

  networks: {
    mumbai: {
      url: ALCHEMY_API_URL ?? "",
      accounts: [PRIVATE_KEY ?? ""],
    },
  },
  etherscan: {
    apiKey: POLYGON_KEY || "",
  },
};

export default config;
