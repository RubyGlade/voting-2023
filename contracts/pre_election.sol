// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

contract PreElection {

    address admin;

    // @storage struct of a Poll
    // bytes8[] candidates is an array of roll numbers
    // uint256[] votes is the array of voter responses 
    // ex: 312 in the array means the 3rd roll no in candidates is given 1st pref, 1st roll no is given 2nd pref, 2nd roll no is given 3rd pref
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
    mapping (bytes4 => PollStruct) public departmentPolls;
    mapping (bytes2 => PollStruct) public centralPolls;
    mapping (bytes4 => PollStruct) public hostelPolls;

    // @func add new poll to mapping
    // @dev has to be hardcoded into contract itself, can't name variable after func arg
    // @dev write some script to hardcode this into the contract
    function setPoll() public onlyAdmin {
        // creating Academic Affairs Sec centralPoll with 3 candidates and adding it to mapping
        PollStruct memory CO;
        CO.noOfCandidates = 3;
        CO.candidates[0] = "MM20B056";
        CO.candidates[1] = "PH20B009";
        CO.candidates[2] = "ME20B109";
        centralPolls["CO"] = CO;

        // creating Health and Hygiene Sec hostelPoll with 3 candidates and adding it to mapping
        PollStruct memory AKHH;
        AKHH.candidates[0] = "NA20B007";
        AKHH.candidates[1] = "NA20B016";
        AKHH.candidates[2] = "ME20B020";
        hostelPolls["AKHH"] = AKHH;
        
        // creating CHBT department legislator for B.Tech with 3 candidate 
        PollStruct memory CHBT;
        CHBT.candidates[0] = "CH20B091"; 
        CHBT.candidates[1] = "CH20B067";
        CHBT.candidates[2] = "CH20B023";
        departmentPolls["CHBT"] = CHBT;
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

    // @func adding a new node to the list of nodes, for setting up a new device
    // @param address of the new node
    function addNode(address _node) public onlyAdmin {
        nodes.push(_node);
        nodeExists[_node] = true;
    }

    constructor() public {
        admin = msg.sender;
    }
    
    bool start = false;
    // @func to start election process
    function startElection() public onlyAdmin {
        start = true;
    }

    modifier electionStarted {
        require (start == true, "Vote not registered since election hasn't started yet");
        _;
    }

    bool end = false;
    // @func to end election process
    function endElection() public onlyAdmin {
        end = true;
    }

    modifier electionEnded {
        require (end == true, "Vote not registered since election is ended");
        _;
    }
}