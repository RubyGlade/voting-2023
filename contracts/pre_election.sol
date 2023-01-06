// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

contract PreElection {

    address admin;

    // @storage struct of a Poll
    // bytes8[] candidates is an array of roll numbers
    // bytes8[] votes is the array of voter responses 
    // ex: 312 in the array means the 1st roll no in candidates is given 3rd pref, 2nd roll no is given 1st pref, 3rd roll no is given 2nd pref
    struct PollStruct {
        uint256 abstainedVotes; // default 0
        uint256 rejectedVotes; // default 0
        uint256 totalVotes; // default 0
        uint256 noOfCandidates; // to be declared
        bytes8[] candidates; // to be declared
        uint256[] votes; // default empty
    }

    // @storage list of all nodes (wallet addresses of all the booth laptops)
    // @storage verification mapping of node existing
    address[] nodes;
    mapping(address => bool) public nodeExists;
    
    // @storage the main storage structure which consists of PollStruct inside
    mapping (bytes4 => PollStruct) departmentPolls;
    mapping (bytes2 => PollStruct) centralPolls;
    mapping (bytes4 => PollStruct) hostelPolls;

    // @func add new poll to mapping
    // @dev has to be hardcoded into contract itself, can't name variable after func arg
    // @dev write some script to hardcode this into the contract
    function setPoll() public onlyAdmin {
        // creating Academic Affairs Sec centralPoll with 3 candidates and adding it to mapping
        PollStruct memory AA;
        AA.noOfCandidates = 3;
        AA.candidates[0] = "NA20B007";
        AA.candidates[1] = "NA20B016";
        AA.candidates[2] = "NA20B020";
        centralPolls["AA"] = AA;

        // creating Health and Hygiene Sec hostelPoll with 2 candidates and adding it to mapping
        PollStruct memory AKHH;
        AKHH.candidates[0] = "NA20B007";
        AKHH.candidates[1] = "NA20B016";
        hostelPolls["AKHH"] = AKHH;
        
        // creating CS department legislator for B.Tech with 1 candidate (unanimous)
        PollStruct memory CSBT;
        CSBT.candidates[0] = "CS20B009";
        departmentPolls["CSBT"] = CSBT;
    }

    // @mod admin functions
    modifier onlyAdmin() {
        require(msg.sender == admin, "Access denied since user is not admin");
        _;
    }
    
    // @mod for allowing only nodes to cast votes
    modifier onlyNode() {
        require(nodeExists[msg.sender], "Invalid Node");
        _;
    }

    constructor() public {
        admin = msg.sender;
    }

    // @func adding a new node to the list of nodes, for setting up a new device
    // @param address of the new node
    function addNode(address _node) public onlyAdmin {
        nodes.push(_node);
        nodeExists[_node] = true;
    }
}