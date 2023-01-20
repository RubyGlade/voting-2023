// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

  const PreElection = await hre.ethers.getContractFactory("PreElection");
  const preElection = await PreElection.deploy();
  await preElection.deployed();

  const InElection = await hre.ethers.getContractFactory("InElection");
  const inElection = await InElection.deploy();
  await inElection.deployed();

  const PostElection = await hre.ethers.getContractFactory("PostElection");
  const postElection = await PostElection.deploy();
  await postElection.deployed();

  console.log(
    `Pre_election deployed at address ${preElection.address} \n In_election deployed at address ${inElection.address} \n Post_election deployed at address ${postElection.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

// Pre_election deployed at address 0x9936A4Df0eF78A0244d785250B67fB01fd5C71d8 
// In_election deployed at address 0x7aac912e0Ea458C95E95B6db861492792dD3f4f0 
// Post_election deployed at address 0x9E2bbe00a67B04B2DB497000F911F006B3709E0F