require("@nomicfoundation/hardhat-toolbox");
// Import and configure dotenv
require("dotenv").config();
// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  networks:{
    goerli:{
      url:"https://proud-yolo-night.ethereum-goerli.discover.quiknode.pro/13301ae87f0af936e6ed14e114cceaac26a786ea/",
      accounts:["71000f075f5389c33ee2f4e8b0d882b25b00df544eb3e50a4fdc5cb034a6ecca"]
    },
    mainnet:{
      url:"https://sparkling-hardworking-resonance.discover.quiknode.pro/c2f8dfbfbb7901ba432aa3f41eae883e057da922/",
      accounts:["71000f075f5389c33ee2f4e8b0d882b25b00df544eb3e50a4fdc5cb034a6ecca"]
    },
  },
};
