// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

import {PreElection} from "../contracts/preElection.sol";

contract AddHostelPollsC is PreElection {
    constructor() {
        PollStruct memory NMGS;
        NMGS.noOfCandidates = 3;
        hostelPolls["NMGS"] = NMGS;
        hostelPollCodes.push("NMGS");

        PollStruct memory NMHH;
        NMHH.noOfCandidates = 3;
        hostelPolls["NMHH"] = NMHH;
        hostelPollCodes.push("NMHH");

        PollStruct memory NMHL;
        NMHL.noOfCandidates = 3;
        hostelPolls["NMHL"] = NMHL;
        hostelPollCodes.push("NMHL");

        PollStruct memory NMLS;
        NMLS.noOfCandidates = 3;
        hostelPolls["NMLS"] = NMLS;
        hostelPollCodes.push("NMLS");

        PollStruct memory NMSO;
        NMSO.noOfCandidates = 3;
        hostelPolls["NMSO"] = NMSO;
        hostelPollCodes.push("NMSO");

        PollStruct memory NMSP;
        NMSP.noOfCandidates = 3;
        hostelPolls["NMSP"] = NMSP;
        hostelPollCodes.push("NMSP");

        PollStruct memory NMTS;
        NMTS.noOfCandidates = 3;
        hostelPolls["NMTS"] = NMTS;
        hostelPollCodes.push("NMTS");

        PollStruct memory PMGS;
        PMGS.noOfCandidates = 3;
        hostelPolls["PMGS"] = PMGS;
        hostelPollCodes.push("PMGS");

        PollStruct memory PMHH;
        PMHH.noOfCandidates = 3;
        hostelPolls["PMHH"] = PMHH;
        hostelPollCodes.push("PMHH");

        PollStruct memory PMHL;
        PMHL.noOfCandidates = 3;
        hostelPolls["PMHL"] = PMHL;
        hostelPollCodes.push("PMHL");

        PollStruct memory PMLS;
        PMLS.noOfCandidates = 3;
        hostelPolls["PMLS"] = PMLS;
        hostelPollCodes.push("PMLS");
        PollStruct memory PMSO;
        PMSO.noOfCandidates = 3;
        hostelPolls["PMSO"] = PMSO;
        hostelPollCodes.push("PMSO");

        PollStruct memory PMSP;
        PMSP.noOfCandidates = 3;
        hostelPolls["PMSP"] = PMSP;
        hostelPollCodes.push("PMSP");

        PollStruct memory PMTS;
        PMTS.noOfCandidates = 3;
        hostelPolls["PMTS"] = PMTS;
        hostelPollCodes.push("PMTS");

        PollStruct memory SMGS;
        SMGS.noOfCandidates = 3;
        hostelPolls["SMGS"] = SMGS;
        hostelPollCodes.push("SMGS");

        PollStruct memory SMHH;
        SMHH.noOfCandidates = 3;
        hostelPolls["SMHH"] = SMHH;
        hostelPollCodes.push("SMHH");

        PollStruct memory SMHL;
        SMHL.noOfCandidates = 3;
        hostelPolls["SMHL"] = SMHL;
        hostelPollCodes.push("SMHL");

        PollStruct memory SMLS;
        SMLS.noOfCandidates = 3;
        hostelPolls["SMLS"] = SMLS;
        hostelPollCodes.push("SMLS");

        PollStruct memory SMSO;
        SMSO.noOfCandidates = 3;
        hostelPolls["SMSO"] = SMSO;
        hostelPollCodes.push("SMSO");

        PollStruct memory SMSP;
        SMSP.noOfCandidates = 3;
        hostelPolls["SMSP"] = SMSP;
        hostelPollCodes.push("SMSP");

        PollStruct memory SMTS;
        SMTS.noOfCandidates = 3;
        hostelPolls["SMTS"] = SMTS;
        hostelPollCodes.push("SMTS");

        PollStruct memory SSGS;
        SSGS.noOfCandidates = 3;
        hostelPolls["SSGS"] = SSGS;
        hostelPollCodes.push("SSGS");

        PollStruct memory SSHH;
        SSHH.noOfCandidates = 3;
        hostelPolls["SSHH"] = SSHH;
        hostelPollCodes.push("SSHH");

        PollStruct memory SSHL;
        SSHL.noOfCandidates = 3;
        hostelPolls["SSHL"] = SSHL;
        hostelPollCodes.push("SSHL");

        PollStruct memory SSLS;
        SSLS.noOfCandidates = 3;
        hostelPolls["SSLS"] = SSLS;
        hostelPollCodes.push("SSLS");

        PollStruct memory SSSO;
        SSSO.noOfCandidates = 3;
        hostelPolls["SSSO"] = SSSO;
        hostelPollCodes.push("SSSO");

        PollStruct memory SSSP;
        SSSP.noOfCandidates = 3;
        hostelPolls["SSSP"] = SSSP;
        hostelPollCodes.push("SSSP");

        PollStruct memory SSTS;
        SSTS.noOfCandidates = 3;
        hostelPolls["SSTS"] = SSTS;
        hostelPollCodes.push("SSTS");

        PollStruct memory SHGS;
        SHGS.noOfCandidates = 3;
        hostelPolls["SHGS"] = SHGS;
        hostelPollCodes.push("SHGS");

        PollStruct memory SHHH;
        SHHH.noOfCandidates = 3;
        hostelPolls["SHHH"] = SHHH;
        hostelPollCodes.push("SHHH");

        PollStruct memory SHHL;
        SHHL.noOfCandidates = 3;
        hostelPolls["SHHL"] = SHHL;
        hostelPollCodes.push("SHHL");

        PollStruct memory SHLS;
        SHLS.noOfCandidates = 3;
        hostelPolls["SHLS"] = SHLS;
        hostelPollCodes.push("SHLS");

        PollStruct memory SHSO;
        SHSO.noOfCandidates = 3;
        hostelPolls["SHSO"] = SHSO;
        hostelPollCodes.push("SHSO");

        PollStruct memory SHSP;
        SHSP.noOfCandidates = 3;
        hostelPolls["SHSP"] = SHSP;
        hostelPollCodes.push("SHSP");

        PollStruct memory SHTS;
        SHTS.noOfCandidates = 3;
        hostelPolls["SHTS"] = SHTS;
        hostelPollCodes.push("SHTS");
    }
}
