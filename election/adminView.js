const ethers = require("ethers");

// Infura provider ID
const INFURA_ID = '80f66721ab284276b1faeb59e5b83e46';
// Infura URL provider
const provider = new ethers.providers.JsonRpcProvider(`https://goerli.infura.io/v3/${INFURA_ID}`);

function stringToBytes2(str) {
    return ethers.utils.hexlify(ethers.utils.toUtf8Bytes(str, 2));
}
function stringToBytes4(str) {
    return ethers.utils.hexlify(ethers.utils.toUtf8Bytes(str, 4));
}

// Deploy the contract and paste the ABI of the contract
const post_election_abi = ["function getCentralPollDetails (bytes2 pollPositionCode) public view onlyAdmin returns (uint256[4] memory details)",
"getHostelPollDetails (bytes4 pollHostelPositionCode) public view onlyAdmin returns (uint256[4] memory details)",
"function getDepartmentPollDetails (bytes4 pollDepartmentPositionCode) public view onlyAdmin returns (uint256[4] memory details)",
"function getCentralPollVotes (bytes2 pollPositionCode) public view onlyAdmin returns (uint256[] memory)",
"function getHostelPollVotes (bytes4 pollHostelPositionCode) public view onlyAdmin returns (uint256[] memory)",
"function getDepartmentPollVotes (bytes2 pollDepartmentPositionCode) public view onlyAdmin returns (uint256[] memory)"];

const address = '0x9E2bbe00a67B04B2DB497000F911F006B3709E0F';
const contract = new ethers.Contract(address, post_election_abi, provider);

const main = async () => {
    const CentralPollDetails = await contract.getCentralPollDetails(stringToBytes2("CO"));
    const HostelPollDetails = await contract.getHostelPollDetails(stringToBytes4("AKHH"));
    const DepartmentPollDetails = await contract.getDepartmentPollDetails(stringToBytes4("CHBT"));
    
}