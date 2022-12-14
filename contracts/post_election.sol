pragma solidity ^0.7.0;

// SPDX-License-Identifier: MIT

import { InElection } from "../contracts/in_election.sol";
import { PreElection } from "../contracts/pre_election.sol";


contract ResultCalculator is PreElection, InElection {

    // @func view functions to find overall details of a poll
    // @param bytes2 pollCode if central bytes4 pollCode if anything else
    // @output [abstainedVotes, rejectedVotes, nonAbstainedVotes, totalVotes]
    function getCentralPollDetails (bytes2 pollPositionCode) public view onlyAdmin returns (uint256[4] memory details) {
        return [
            centralPolls[pollPositionCode].abstainedVotes,
            centralPolls[pollPositionCode].rejectedVotes,
            centralPolls[pollPositionCode].totalVotes - centralPolls[pollPositionCode].abstainedVotes,
            centralPolls[pollPositionCode].totalVotes
        ];
    }

    function getHostelPollDetails (bytes4 pollHostelPositionCode) public view onlyAdmin returns (uint256[4] memory details) {
        return [
            hostelPolls[pollHostelPositionCode].abstainedVotes,
            hostelPolls[pollHostelPositionCode].rejectedVotes,
            hostelPolls[pollHostelPositionCode].totalVotes - hostelPolls[pollHostelPositionCode].abstainedVotes,
            hostelPolls[pollHostelPositionCode].totalVotes];
    }

    function getDepartmentPollDetails (bytes4 pollDepartmentPositionCode) public view onlyAdmin returns (uint256[4] memory details) {
        return [
            departmentPolls[pollDepartmentPositionCode].abstainedVotes,
            departmentPolls[pollDepartmentPositionCode].rejectedVotes,
            departmentPolls[pollDepartmentPositionCode].totalVotes- departmentPolls[pollDepartmentPositionCode].abstainedVotes,
            departmentPolls[pollDepartmentPositionCode].totalVotes];
    }

    // @func find votes of each candidate in a poll
    // @param bytes2 pollCode if central bytes4 pollCode if anything else
    // @output uint256[], where each element is the vote of some candidate
    function getCentralPollVotes (bytes2 pollPositionCode) public view onlyAdmin returns (uint256[] memory) {
        return centralPolls[pollPositionCode].votes;
    }

    function getHostelPollVotes (bytes4 pollHostelPositionCode) public view onlyAdmin returns (uint256[] memory) {
        return hostelPolls[pollHostelPositionCode].votes;
    }

    function getDepartmentPollVotes (bytes2 pollDepartmentPositionCode) public view onlyAdmin returns (uint256[] memory) {
        return departmentPolls[pollDepartmentPositionCode].votes;
    }

    // @storage nested mapping to hold the number of voters under one combination of preferences
    mapping (bytes2 => mapping (bytes1 => uint256)) centralPollCount;
    mapping (bytes4 => mapping (bytes1 => uint256)) hostelPollCount;
    mapping (bytes4 => mapping (bytes1 => uint256)) departmentPollCount;

    // @func to calculate the number of voters under one combination of preferences
    // adds 1 to the mapping's value if the key already exists, else creates the key and sets value = 1
    // @param pollCode
    // @output returns a mapping telling number of people 
    // function centralCalculateFirstPrefs (bytes2 pollPositionCode) public onlyAdmin {
    //     bytes8[] memory votes = centralPolls[pollPositionCode].votes;
    //     for (uint8 i=0; i<votes.length; i++) {
    //         for (uint8 j=0; j<centralPolls[pollPositionCode].noOfCandidates; j++) {
    //             if (keccak256(abi.encodePacked(votes[i][0])) == keccak256(abi.encodePacked(bytes1(j))) && centralPollCount[pollPositionCode][bytes1(j)] == 0) {
    //                 centralPollCount[pollPositionCode][bytes1(j)] = 1;
    //             }
    //             else if (keccak256(abi.encodePacked(votes[i][0])) == keccak256(abi.encodePacked(bytes1(j))) && centralPollCount[pollPositionCode][bytes1(j)] > 0) {
    //                 centralPollCount[pollPositionCode][bytes1(j)] += 1;
    //             }
    //         }
    //     }
    // }

    // function hostelCalculateFirstPrefs (bytes2 pollHostelPositionCode) public onlyAdmin {
    //     bytes8[] memory votes = hostelPolls[pollHostelPositionCode].votes;
    //     for (uint i=0; i<votes.length; i++) {
    //         for (uint8 j=0; j<hostelPolls[pollHostelPositionCode].noOfCandidates; j++) {
    //             if (keccak256(abi.encodePacked(votes[i][0])) == keccak256(abi.encodePacked(bytes1(j))) && hostelPollCount[pollHostelPositionCode][bytes1(j)] == 0) {
    //                 hostelPollCount[pollHostelPositionCode][bytes1(j)] = 1;
    //             }
    //             else if (keccak256(abi.encodePacked(votes[i][0])) == keccak256(abi.encodePacked(bytes1(j))) && hostelPollCount[pollHostelPositionCode][bytes1(j)] > 0) {
    //                 hostelPollCount[pollHostelPositionCode][bytes1(j)] += 1;
    //             }
    //         }
    //     }
    // }

    // function departmentCalculateFirstPrefs (bytes2 pollDepartmentPositionCode) public onlyAdmin {
    //     bytes8[] memory votes = departmentPolls[pollDepartmentPositionCode].votes;
    //     for (uint i=0; i<votes.length; i++) {
    //         for (uint8 j=0; j<departmentPolls[pollDepartmentPositionCode].noOfCandidates; j++) {
    //             if (keccak256(abi.encodePacked(votes[i][0])) == keccak256(abi.encodePacked(bytes1(j))) && departmentPollCount[pollDepartmentPositionCode][bytes1(j)] == 0) {
    //                 departmentPollCount[pollDepartmentPositionCode][bytes1(j)] = 1;
    //             }
    //             else if (keccak256(abi.encodePacked(votes[i][0])) == keccak256(abi.encodePacked(bytes1(j))) && departmentPollCount[pollDepartmentPositionCode][bytes1(j)] > 0) {
    //                 departmentPollCount[pollDepartmentPositionCode][bytes1(j)] += 1;
    //             }
    //         }
    //     }
    // }
}