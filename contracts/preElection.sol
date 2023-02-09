// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

contract PreElection {
    /**** PRE-ELECTION SETUP ****/

    address admin = 0xFADD4867EbbAb3Eb04b3C908f8631697a0CE3308;

    // @storage struct of a Poll
    // bytes8[] candidates is an array of roll numbers
    // uint256[] votes is the array of voter responses
    // ex: 312 in the array means the 3rd roll no in candidates is given 1st pref, 1st roll no is given 2nd pref, 2nd roll no is given 3rd pref
    struct PollStruct {
        uint256 abstainedVotes; // default 0
        uint256 rejectedVotes; // default 0
        uint256 totalVotes; // default 0
        uint256 noOfCandidates; // to be declared
        uint256[] votes; // default empty
    }

    // @storage list of all admins (wallet addresses of all the booth laptops)
    // @storage verification mapping of admin existing
    address[] admins;
    mapping(address => bool) public adminExists;

    // @storage the main storage structure which consists of PollStruct inside
    mapping(bytes4 => PollStruct) public departmentPolls;
    mapping(bytes2 => PollStruct) public centralPolls;
    mapping(bytes4 => PollStruct) public hostelPolls;

    // @mod admin functions
    modifier onlyAdmin() {
        require(msg.sender == admin, "ACCESS_DENIED");
        _;
    }

    // @func adding a new admin to the list of admins, for setting up a new device
    // @param address of the new admin
    function addAdmin(address _admin) public onlyAdmin {
        admins.push(_admin);
        adminExists[_admin] = true;
    }

    constructor() {
        admin = msg.sender;
        adminExists[admin] = true;
    }

    bool start = false;

    // @func to start election process
    function startElection() public onlyAdmin {
        start = true;
    }

    modifier electionStarted() {
        require(start == true, "ELECTION_NOT_STARTED");
        _;
    }

    bool end = false;

    // @func to end election process
    function endElection() public onlyAdmin {
        end = true;
    }

    modifier electionEnded() {
        require(end == true, "ELECTION_ENDED");
        _;
    }

    function viewAdmins() public view onlyAdmin returns (address[] memory) {
        return admins;
    }

    // @storage list of all polls, to check whether the incoming data belongs to an actual existing poll
    bytes2[] centralPollCodes;
    bytes4[] hostelPollCodes;
    bytes4[] departmentPollCodes;

    // @func for getting bytes2 object out of the votecode
    function concat2(bytes1 a, bytes1 b) internal pure returns (bytes2) {
        return bytes2((uint16(uint8(a)) << 8) | uint8(b));
    }

    // @func for getting bytes4 object out of the votecode
    function concat4(
        bytes1 a,
        bytes1 b,
        bytes1 c,
        bytes1 d
    ) internal pure returns (bytes4) {
        bytes2 x = concat2(a, b);
        bytes2 y = concat2(c, d);
        return bytes4((uint32(uint16(x)) << 16) | uint16(y));
    }

    // @func to convert the preferential votecode to uint256
    function bytes32ToBytes(bytes32 data) internal pure returns (bytes memory) {
        uint256 i = 0;
        while (i < 32 && uint8(data[i]) != 0) {
            ++i;
        }
        bytes memory result = new bytes(i);
        i = 0;
        while (i < 32 && data[i] != 0) {
            result[i] = data[i];
            ++i;
        }
        return result;
    }

    function bytesToCentralVote(bytes memory data)
        internal
        pure
        returns (uint256)
    {
        bytes memory temp = new bytes(data.length - 5);
        for (uint256 i = 0; i < data.length - 5; i++) {
            temp[i] = data[i + 5];
        }

        uint256 result;
        for (uint256 j = 0; j < temp.length; j++) {
            result =
                result +
                (uint256(uint8(temp[j])) - 48) *
                (10**(temp.length - (j + 1)));
        }
        return result;
    }

    function bytesToHostOrDeptVote(bytes memory data)
        internal
        pure
        returns (uint256)
    {
        bytes memory temp = new bytes(data.length - 7);
        for (uint256 i = 0; i < data.length - 7; i++) {
            temp[i] = data[i + 7];
        }

        uint256 result;
        for (uint256 j = 0; j < temp.length; j++) {
            result =
                result +
                (uint256(uint8(temp[j])) - 48) *
                (10**(temp.length - (j + 1)));
        }
        return result;
    }

    function bytes32ToCentralVote(bytes32 votecode)
        internal
        pure
        returns (uint256)
    {
        return (bytesToCentralVote(bytes32ToBytes(votecode)));
    }

    function bytes32ToHostOrDepVote(bytes32 votecode)
        internal
        pure
        returns (uint256)
    {
        return (bytesToHostOrDeptVote(bytes32ToBytes(votecode)));
    }
}
