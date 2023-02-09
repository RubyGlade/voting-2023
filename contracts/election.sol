// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

import {PreElection} from "../contracts/preElection.sol";
import {AddHostelPollsA} from "../contracts/addHostelPollsA.sol";
import {AddHostelPollsB} from "../contracts/addHostelPollsB.sol";
import {AddHostelPollsC} from "../contracts/addHostelPollsC.sol";
import {AddHostelPollsD} from "../contracts/addHostelPollsD.sol";
import {AddOtherPolls} from "../contracts/addOtherPolls.sol";

contract Election is
    PreElection,
    AddHostelPollsA,
    AddHostelPollsB,
    AddHostelPollsC,
    AddHostelPollsD,
    AddOtherPolls
{
    /**** IN-ELECTION FUNCTIONS ****/

    // @func to confirm whether the poll exists within the list
    // if some pollCode which doesn't exist is sent, the transaction won't pass through
    // add a require condition where this function has to return true before each segment in the addVote function
    function hostelPollExists(bytes4 hostelPollCode)
        public
        view
        returns (bool)
    {
        bool isValid = false;
        for (uint256 i = 0; i < hostelPollCodes.length; i++) {
            if (
                keccak256(abi.encodePacked(hostelPollCode)) ==
                keccak256(abi.encodePacked(hostelPollCodes[i]))
            ) {
                isValid = true;
            }
        }
        return isValid;
    }

    function centralPollExists(bytes2 centralPollCode)
        public
        view
        returns (bool)
    {
        bool isValid = false;
        for (uint256 i = 0; i < centralPollCodes.length; i++) {
            if (
                keccak256(abi.encodePacked(centralPollCode)) ==
                keccak256(abi.encodePacked(centralPollCodes[i]))
            ) {
                isValid = true;
            }
        }
        return isValid;
    }

    function departmentPollExists(bytes4 departmentPollCode)
        public
        view
        returns (bool)
    {
        bool isValid = false;
        for (uint256 i = 0; i < departmentPollCodes.length; i++) {
            if (
                keccak256(abi.encodePacked(departmentPollCode)) ==
                keccak256(abi.encodePacked(departmentPollCodes[i]))
            ) {
                isValid = true;
            }
        }
        return isValid;
    }

    function addVote(bytes32[] calldata votecode) public onlyAdmin {
        for (uint256 i = 0; i < votecode.length; i++) {
            bytes32 thisPollCode = votecode[i];
            // central poll
            if (
                keccak256(abi.encodePacked(thisPollCode[0])) ==
                keccak256(abi.encodePacked(bytes1("1")))
            ) {
                bytes2 pollPositionCode = concat2(
                    thisPollCode[1],
                    thisPollCode[2]
                );
                require(centralPollExists(pollPositionCode), "INVALID_POLL");
                // abstained vote
                if (
                    keccak256(abi.encodePacked(thisPollCode[3])) ==
                    keccak256(abi.encodePacked(bytes1("1")))
                ) {
                    centralPolls[pollPositionCode].abstainedVotes += 1;
                }
                // rejected vote
                else if (
                    keccak256(abi.encodePacked(thisPollCode[4])) ==
                    keccak256(abi.encodePacked(bytes1("1")))
                ) {
                    centralPolls[pollPositionCode].rejectedVotes += 1;
                }
                // preferential vote
                else {
                    uint256 vote = bytes32ToCentralVote(thisPollCode);
                    centralPolls[pollPositionCode].votes.push(vote);
                }
                // totalVotes incremented by 1
                centralPolls[pollPositionCode].totalVotes += 1;
            }
            // hostel poll
            else if (
                keccak256(abi.encodePacked(thisPollCode[0])) ==
                keccak256(abi.encodePacked(bytes1("2")))
            ) {
                bytes4 pollHostelPositionCode = concat4(
                    thisPollCode[1],
                    thisPollCode[2],
                    thisPollCode[3],
                    thisPollCode[4]
                );
                require(
                    hostelPollExists(pollHostelPositionCode),
                    "INVALID_POLL"
                );
                if (
                    keccak256(abi.encodePacked(thisPollCode[5])) ==
                    keccak256(abi.encodePacked(bytes1("1")))
                ) {
                    hostelPolls[pollHostelPositionCode].abstainedVotes += 1;
                } else if (
                    keccak256(abi.encodePacked(thisPollCode[6])) ==
                    keccak256(abi.encodePacked(bytes1("1")))
                ) {
                    hostelPolls[pollHostelPositionCode].rejectedVotes += 1;
                } else {
                    uint256 vote = bytes32ToHostOrDepVote(thisPollCode);
                    hostelPolls[pollHostelPositionCode].votes.push(vote);
                }
                // totalVotes incremented by 1
                hostelPolls[pollHostelPositionCode].totalVotes += 1;
            }
            // department poll
            else if (
                keccak256(abi.encodePacked(thisPollCode[0])) ==
                keccak256(abi.encodePacked(bytes1("3")))
            ) {
                bytes4 pollDepartmentPositionCode = concat4(
                    thisPollCode[1],
                    thisPollCode[2],
                    thisPollCode[3],
                    thisPollCode[3]
                );
                require(
                    departmentPollExists(pollDepartmentPositionCode),
                    "INVALID_POLL"
                );
                if (
                    keccak256(abi.encodePacked(thisPollCode[5])) ==
                    keccak256(abi.encodePacked(bytes1("1")))
                ) {
                    hostelPolls[pollDepartmentPositionCode].abstainedVotes += 1;
                } else if (
                    keccak256(abi.encodePacked(thisPollCode[6])) ==
                    keccak256(abi.encodePacked(bytes1("1")))
                ) {
                    hostelPolls[pollDepartmentPositionCode].rejectedVotes += 1;
                } else {
                    uint256 vote = bytes32ToHostOrDepVote(thisPollCode);
                    departmentPolls[pollDepartmentPositionCode].votes.push(
                        vote
                    );
                }
                // totalVotes incremented by 1
                departmentPolls[pollDepartmentPositionCode].totalVotes += 1;
            }
        }
    }

    /**** POST-ELECTION FUNCTIONS ****/

    function getCentralPollDetails(bytes2 pollPositionCode)
        public
        view
        onlyAdmin
        returns (uint256[4] memory details)
    {
        return [
            centralPolls[pollPositionCode].abstainedVotes,
            centralPolls[pollPositionCode].rejectedVotes,
            centralPolls[pollPositionCode].totalVotes -
                centralPolls[pollPositionCode].abstainedVotes,
            centralPolls[pollPositionCode].totalVotes
        ];
    }

    function getHostelPollDetails(bytes4 pollHostelPositionCode)
        public
        view
        onlyAdmin
        returns (uint256[4] memory details)
    {
        return [
            hostelPolls[pollHostelPositionCode].abstainedVotes,
            hostelPolls[pollHostelPositionCode].rejectedVotes,
            hostelPolls[pollHostelPositionCode].totalVotes -
                hostelPolls[pollHostelPositionCode].abstainedVotes,
            hostelPolls[pollHostelPositionCode].totalVotes
        ];
    }

    function getDepartmentPollDetails(bytes4 pollDepartmentPositionCode)
        public
        view
        onlyAdmin
        returns (uint256[4] memory details)
    {
        return [
            departmentPolls[pollDepartmentPositionCode].abstainedVotes,
            departmentPolls[pollDepartmentPositionCode].rejectedVotes,
            departmentPolls[pollDepartmentPositionCode].totalVotes -
                departmentPolls[pollDepartmentPositionCode].abstainedVotes,
            departmentPolls[pollDepartmentPositionCode].totalVotes
        ];
    }

    // @func find votes of each candidate in a poll
    // @param bytes2 pollCode if central bytes4 pollCode if anything else
    // @output uint256[], where each element is the vote of some candidate
    function getCentralPollVotes(bytes2 pollPositionCode)
        public
        view
        onlyAdmin
        returns (uint256[] memory)
    {
        return centralPolls[pollPositionCode].votes;
    }

    function getHostelPollVotes(bytes4 pollHostelPositionCode)
        public
        view
        onlyAdmin
        returns (uint256[] memory)
    {
        return hostelPolls[pollHostelPositionCode].votes;
    }

    function getDepartmentPollVotes(bytes2 pollDepartmentPositionCode)
        public
        view
        onlyAdmin
        returns (uint256[] memory)
    {
        return departmentPolls[pollDepartmentPositionCode].votes;
    }
}
