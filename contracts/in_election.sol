// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import { PreElection } from "../contracts/pre_election.sol";

contract InElection is PreElection {

    // @func for getting bytes2 object out of the votecode
    function concat2 (bytes1 a, bytes1 b) public pure returns (bytes2) {
        return bytes2 (uint16 (uint8 (a)) << 8 | uint8 (b));
    }

    // @func for getting bytes4 object out of the votecode 
    function concat4 (bytes1 a, bytes1 b, bytes1 c, bytes1 d) public pure returns (bytes4) {
        bytes2 x = concat2(a, b);
        bytes2 y = concat2(c, d);
        return bytes4 (uint32 (uint16 (x)) << 16 | uint16(y));
    }

    // @func to convert the preferential votecode to uint256
    function bytesToVote(bytes memory b) public pure returns (uint256) {
        uint256 result;
        for (uint i=0; i<b.length; i++) {
            result = result + (uint(uint8(b[i]))-48)*(10**(b.length-(i+1)));
        }
        return result;
    }

    function addVote(bytes16[] calldata votecode) public onlyNode {
        for (uint i=0; i< votecode.length; i++) {
            bytes16 thisPollCode = votecode[i];
            // central poll
            if (keccak256(abi.encodePacked(thisPollCode[0])) == keccak256(abi.encodePacked(bytes1("1")))) {
                bytes2 pollPositionCode = concat2(votecode[i][1], votecode[i][2]);
                // abstained vote
                if (keccak256(abi.encodePacked(thisPollCode[3])) == keccak256(abi.encodePacked(bytes1("1")))) {
                    centralPolls[pollPositionCode].abstainedVotes++;
                }
                // rejected vote
                else if (keccak256(abi.encodePacked(thisPollCode[4])) == keccak256(abi.encodePacked(bytes1("1")))) {
                    centralPolls[pollPositionCode].rejectedVotes++;
                }
                // preferential vote
                else {
                    bytes memory temp;
                    for (uint256 j=5; j<thisPollCode.length-5; j++) {
                        temp[j-5] = (thisPollCode[j]);
                    }
                    uint256 vote = bytesToVote(temp);
                    centralPolls[pollPositionCode].votes.push(vote);
                }
                // totalVotes incremented by 1
                centralPolls[pollPositionCode].totalVotes += 1;
            }
            // hostel poll
            else if (keccak256(abi.encodePacked(thisPollCode[0])) == keccak256(abi.encodePacked(bytes1("2")))) {
                bytes4 pollHostelPositionCode = concat4(thisPollCode[1], thisPollCode[2], thisPollCode[3], thisPollCode[4]);
                if (keccak256(abi.encodePacked(thisPollCode[5])) == keccak256(abi.encodePacked(bytes1("1")))) {
                    hostelPolls[pollHostelPositionCode].abstainedVotes += 1;
                } 
                else if (keccak256(abi.encodePacked(thisPollCode[6])) == keccak256(abi.encodePacked(bytes1("1")))) {
                    hostelPolls[pollHostelPositionCode].rejectedVotes += 1;
                }
                else {
                    bytes memory temp;
                    for (uint256 j=7; j<thisPollCode.length-7; j++) {
                        temp[j-7] = (thisPollCode[j]);
                    }
                    uint256 vote = bytesToVote(temp);
                    hostelPolls[pollHostelPositionCode].votes.push(vote);
                }
                // totalVotes incremented by 1
                hostelPolls[pollHostelPositionCode].totalVotes += 1;
            }
            // department poll
            else if (keccak256(abi.encodePacked(thisPollCode[0])) == keccak256(abi.encodePacked(bytes1("3")))) {
                bytes4 pollDepartmentPositionCode = concat4(thisPollCode[1], thisPollCode[2], thisPollCode[3], thisPollCode[3]);
                if (keccak256(abi.encodePacked(thisPollCode[5])) == keccak256(abi.encodePacked(bytes1("1")))) {
                    hostelPolls[pollDepartmentPositionCode].abstainedVotes += 1;
                } 
                else if (keccak256(abi.encodePacked(thisPollCode[6])) == keccak256(abi.encodePacked(bytes1("1")))) {
                    hostelPolls[pollDepartmentPositionCode].rejectedVotes += 1;
                }
                else {
                    bytes memory temp;
                    for (uint256 j=7; j<thisPollCode.length-7; j++) {
                        temp[j-7] = (thisPollCode[j]);
                    }
                    uint256 vote = bytesToVote(temp);
                    departmentPolls[pollDepartmentPositionCode].votes.push(vote);
                }
                // totalVotes incremented by 1
                departmentPolls[pollDepartmentPositionCode].totalVotes += 1;
            }
        }
    }

}

/// Usually, for 2-D arrays, if we say arr[x][y], we get x arrays of length y, but this is NOT the case in Solidity
                        // Solidity does this the other way round, so we get y arrays of length x, weird but yeah
                        // Hence, here, instead of storing one candidate's all preferences in one array, this will store ith preference of all candidates in the one array
                        /// This is actually helpful, while running the IRV function for result calculation, since we can solve each round with O(n) complexity