const { ethers } = require("ethers");
const fs = require("fs");

function stringToBytes2(str) {
    // convert the string to bytes
    const bytes = ethers.utils.toUtf8Bytes(str);
    // extract the first 2 bytes
    const bytes2 = ethers.utils.hexDataSlice(bytes, 0, 2);
    return bytes2;
}

function stringToBytes4(str) {
    // convert the string to bytes
    const bytes = ethers.utils.toUtf8Bytes(str);
    // extract the first 2 bytes
    const bytes4 = ethers.utils.hexDataSlice(bytes, 0, 4);
    return bytes4;
}

const main = async () => {

    let contractAddresses = JSON.parse(fs.readFileSync('../ContractAddresses.json'));
    let INFURA_ID = '80f66721ab284276b1faeb59e5b83e46';
    let provider = new ethers.providers.JsonRpcProvider(`https://goerli.infura.io/v3/${INFURA_ID}`)
    let adminPrivateKey = "a0caae6924e5926393c23d9826ccfbbb07b81e1ece9654c7ef062ce995af6bea";
    let adminWallet = new ethers.Wallet(adminPrivateKey, provider);
    let gasPrice= await provider.getGasPrice();
    let gasLimit = 2500000;

    const ElectionAddress = contractAddresses["Election"];
    const ElectionABI = ["function addVote(bytes32[]) public", 
        "function getCentralPollDetails (bytes2) public view returns (uint256[4] memory)",
        "function getHostelPollDetails (bytes4) public view returns (uint256[4] memory)",
        "function getDepartmentPollDetails (bytes4) public view returns (uint256[4] memory)",
        "function getCentralPollVotes (bytes2) public view returns (uint256[] memory)",
        "function getHostelPollVotes (bytes4) public view returns (uint256[] memory)",
        "function getDepartmentPollVotes (bytes2) public view returns (uint256[] memory)"
    ]
    const ElectionContract = new ethers.Contract(ElectionAddress, ElectionABI, adminWallet)
    let ElectionInterface = new ethers.utils.Interface(ElectionABI);
    
    const PreElectionAddress = contractAddresses["PreElection"];
    const PreElectionABI = [
        "function addAdmin(address) public",
        "function startElection() public", "function endElection() public",
        "function viewAdmins() public view returns (address[])"
    ]
    const PreElectionContract = new ethers.Contract(PreElectionAddress, PreElectionABI, adminWallet);

    // view functions for verification

    const hostelPollVotes = await ElectionContract.getHostelPollVotes(stringToBytes4("AKHH"));
    console.log(hostelPollVotes.map(x => x.toNumber()))
    const hostelPollDetails = await ElectionContract.getHostelPollDetails(stringToBytes4("AKHH"));
    console.log(hostelPollDetails.map(x => x.toNumber()));

    const centralPollVotes = await ElectionContract.getCentralPollVotes(stringToBytes2("AA"));
    console.log(centralPollVotes.map(x => x.toNumber()))
    const centralPollDetails = await ElectionContract.getCentralPollDetails(stringToBytes2("AA"));
    console.log(centralPollDetails.map(x => x.toNumber()));

}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });