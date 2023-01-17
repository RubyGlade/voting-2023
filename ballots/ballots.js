const { ethers, Contract } = require("ethers");

// Infura provider ID
const INFURA_ID = '';
// Infura URL provider
const provider = new ethers.providers.JsonRpcProvider('https://mainnet.infura.io/v3/${INFURA_ID}');

// Deploy the contract and paste the ABI of the contract
const pre_election_abi = [];
// 
const address = '';
const contract = new ethers.Contract(address, )

const main = async () => {
    const balance = await provider.getBalance(address);
    
}