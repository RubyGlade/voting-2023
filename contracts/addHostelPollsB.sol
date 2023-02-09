// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

import {PreElection} from "../contracts/preElection.sol";

contract AddHostelPollsB is PreElection {
    constructor() {
        PollStruct memory JMHH;
        JMHH.noOfCandidates = 3;
        hostelPolls["JMHH"] = JMHH;
        hostelPollCodes.push("JMHH");

        PollStruct memory JMHL;
        JMHL.noOfCandidates = 3;
        hostelPolls["JMHL"] = JMHL;
        hostelPollCodes.push("JMHL");

        PollStruct memory JMLS;
        JMLS.noOfCandidates = 3;
        hostelPolls["JMLS"] = JMLS;
        hostelPollCodes.push("JMLS");

        PollStruct memory JMSO;
        JMSO.noOfCandidates = 3;
        hostelPolls["JMSO"] = JMSO;
        hostelPollCodes.push("JMSO");

        PollStruct memory JMSP;
        JMSP.noOfCandidates = 3;
        hostelPolls["JMSP"] = JMSP;
        hostelPollCodes.push("JMSP");

        PollStruct memory JMTS;
        JMTS.noOfCandidates = 3;
        hostelPolls["JMTS"] = JMTS;
        hostelPollCodes.push("JMTS");

        PollStruct memory KRGS;
        KRGS.noOfCandidates = 3;
        hostelPolls["KRGS"] = KRGS;
        hostelPollCodes.push("KRGS");

        PollStruct memory KRHH;
        KRHH.noOfCandidates = 3;
        hostelPolls["KRHH"] = KRHH;
        hostelPollCodes.push("KRHH");

        PollStruct memory KRHL;
        KRHL.noOfCandidates = 3;
        hostelPolls["KRHL"] = KRHL;
        hostelPollCodes.push("KRHL");

        PollStruct memory KRLS;
        KRLS.noOfCandidates = 3;
        hostelPolls["KRLS"] = KRLS;
        hostelPollCodes.push("KRLS");

        PollStruct memory KRSO;
        KRSO.noOfCandidates = 3;
        hostelPolls["KRSO"] = KRSO;
        hostelPollCodes.push("KRSO");

        PollStruct memory KRSP;
        KRSP.noOfCandidates = 3;
        hostelPolls["KRSP"] = KRSP;
        hostelPollCodes.push("KRSP");

        PollStruct memory KRTS;
        KRTS.noOfCandidates = 3;
        hostelPolls["KRTS"] = KRTS;
        hostelPollCodes.push("KRTS");

        PollStruct memory MHGS;
        MHGS.noOfCandidates = 3;
        hostelPolls["MHGS"] = MHGS;
        hostelPollCodes.push("MHGS");

        PollStruct memory MHHH;
        MHHH.noOfCandidates = 3;
        hostelPolls["MHHH"] = MHHH;
        hostelPollCodes.push("MHHH");

        PollStruct memory MHHL;
        MHHL.noOfCandidates = 3;
        hostelPolls["MHHL"] = MHHL;
        hostelPollCodes.push("MHHL");

        PollStruct memory MHLS;
        MHLS.noOfCandidates = 3;
        hostelPolls["MHLS"] = MHLS;
        hostelPollCodes.push("MHLS");

        PollStruct memory MHSO;
        MHSO.noOfCandidates = 3;
        hostelPolls["MHSO"] = MHSO;
        hostelPollCodes.push("MHSO");

        PollStruct memory MHSP;
        MHSP.noOfCandidates = 3;
        hostelPolls["MHSP"] = MHSP;
        hostelPollCodes.push("MHSP");

        PollStruct memory MHTS;
        MHTS.noOfCandidates = 3;
        hostelPolls["MHTS"] = MHTS;
        hostelPollCodes.push("MHTS");

        PollStruct memory MAGS;
        MAGS.noOfCandidates = 3;
        hostelPolls["MAGS"] = MAGS;
        hostelPollCodes.push("MAGS");

        PollStruct memory MAHH;
        MAHH.noOfCandidates = 3;
        hostelPolls["MAHH"] = MAHH;
        hostelPollCodes.push("MAHH");

        PollStruct memory MAHL;
        MAHL.noOfCandidates = 3;
        hostelPolls["MAHL"] = MAHL;
        hostelPollCodes.push("MAHL");

        PollStruct memory MALS;
        MALS.noOfCandidates = 3;
        hostelPolls["MALS"] = MALS;
        hostelPollCodes.push("MALS");

        PollStruct memory MASO;
        MASO.noOfCandidates = 3;
        hostelPolls["MASO"] = MASO;
        hostelPollCodes.push("MASO");

        PollStruct memory MASP;
        MASP.noOfCandidates = 3;
        hostelPolls["MASP"] = MASP;
        hostelPollCodes.push("MASP");

        PollStruct memory MATS;
        MATS.noOfCandidates = 3;
        hostelPolls["MATS"] = MATS;
        hostelPollCodes.push("MATS");
    }
}
