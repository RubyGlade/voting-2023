require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.7.0",

  networks: {
    goerli: {
      url: "https://goerli.infura.io/v3/80f66721ab284276b1faeb59e5b83e46",
      accounts: ["a0caae6924e5926393c23d9826ccfbbb07b81e1ece9654c7ef062ce995af6bea"],
    },
  },
};
