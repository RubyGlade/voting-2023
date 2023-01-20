const { ethers, Contract } = require("ethers");
const prompt=require("prompt-sync")({sigint:true});

//Provider Engine sub-modules

const ethers = require('ethers');
const Wallet = ethers.Wallet;
const Contract = ethers.Contract;
const utils = ethers.utils;
const providers = ethers.providers;

// Convert string from frontend to bytes16
function stringToBytes16(string) {
    let bytes = ethers.utils.toUtf8Bytes(string);
    let padding = new Uint8Array(16 - bytes.length);
    return ethers.utils.hexlify(ethers.utils.concat([bytes, padding]));
} 

//Note the "0x" appended at the start
let privateKey = "0x3a1076bf45ab87712ad64ccb3b10217737f7faacbf2872e88fdd9a537d8fe266";

let network = "http://192.168.1.1:8545";

//let network = "kovan";
//let network = "ropsten";
//let network = "rinkeby";
//let network = "homestead";

//let infuraAPIKey = "9LPi9fDukz8phfLXdy5K";

let provider = new providersJsonRpcProvider(network, 'homestead');
//let provider = new providers.InfuraProvider(network, infuraAPIKey);

let serverWallet = new Wallet(privateKey, provider);