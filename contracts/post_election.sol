pragma solidity ^0.7.0;

// SPDX-License-Identifier: MIT

import { InElection } from "../contracts/in_election.sol";
import { PreElection } from "../contracts/pre_election.sol";


contract PostElection is PreElection, InElection {

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
}