const { ethers } = require("ethers");

const INFURA_ID = '';
const provider = new ethers.providers.JsonRpcProvider('https://mainnet.infura.io/v3/${INFURA_ID}');

const address = '';

const main = async () => {
    const balance = await provider.getBalance(address);
    console.log("\n ETH balance of ${address} --> ${ethers.utils.formatEthers(balance)} ETH\n");
}