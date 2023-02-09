// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

import {PreElection} from "../contracts/preElection.sol";

contract AddHostelPollsA is PreElection {
    constructor() {
        PollStruct memory AKGS;
        AKGS.noOfCandidates = 3;
        hostelPolls["AKGS"] = AKGS;
        hostelPollCodes.push("AKGS");

        PollStruct memory AKHH;
        AKHH.noOfCandidates = 3;
        hostelPolls["AKHH"] = AKHH;
        hostelPollCodes.push("AKHH");

        PollStruct memory AKHL;
        AKHL.noOfCandidates = 3;
        hostelPolls["AKHL"] = AKHL;
        hostelPollCodes.push("AKHL");

        PollStruct memory AKLS;
        AKLS.noOfCandidates = 3;
        hostelPolls["AKLS"] = AKLS;
        hostelPollCodes.push("AKLS");

        PollStruct memory AKSO;
        AKSO.noOfCandidates = 3;
        hostelPolls["AKSO"] = AKSO;
        hostelPollCodes.push("AKSO");

        PollStruct memory AKSP;
        AKSP.noOfCandidates = 3;
        hostelPolls["AKSP"] = AKSP;
        hostelPollCodes.push("AKSP");

        PollStruct memory AKTS;
        AKTS.noOfCandidates = 3;
        hostelPolls["AKTS"] = AKTS;
        hostelPollCodes.push("AKTS");

        PollStruct memory BHGS;
        BHGS.noOfCandidates = 3;
        hostelPolls["BHGS"] = BHGS;
        hostelPollCodes.push("BHGS");

        PollStruct memory BHHH;
        BHHH.noOfCandidates = 3;
        hostelPolls["BHHH"] = BHHH;
        hostelPollCodes.push("BHHH");

        PollStruct memory BHHL;
        BHHL.noOfCandidates = 3;
        hostelPolls["BHHL"] = BHHL;
        hostelPollCodes.push("BHHL");

        PollStruct memory BHLS;
        BHLS.noOfCandidates = 3;
        hostelPolls["BHLS"] = BHLS;
        hostelPollCodes.push("BHLS");

        PollStruct memory BHSO;
        BHSO.noOfCandidates = 3;
        hostelPolls["BHSO"] = BHSO;
        hostelPollCodes.push("BHSO");

        PollStruct memory BHSP;
        BHSP.noOfCandidates = 3;
        hostelPolls["BHSP"] = BHSP;
        hostelPollCodes.push("BHSP");

        PollStruct memory BHTS;
        BHTS.noOfCandidates = 3;
        hostelPolls["BHTS"] = BHTS;
        hostelPollCodes.push("BHTS");

        PollStruct memory BRGS;
        BRGS.noOfCandidates = 3;
        hostelPolls["BRGS"] = BRGS;
        hostelPollCodes.push("BRGS");

        PollStruct memory BRHH;
        BRHH.noOfCandidates = 3;
        hostelPolls["BRHH"] = BRHH;
        hostelPollCodes.push("BRHH");

        PollStruct memory BRHL;
        BRHL.noOfCandidates = 3;
        hostelPolls["BRHL"] = BRHL;
        hostelPollCodes.push("BRHL");

        PollStruct memory BRLS;
        BRLS.noOfCandidates = 3;
        hostelPolls["BRLS"] = BRLS;
        hostelPollCodes.push("BRLS");

        PollStruct memory BRSO;
        BRSO.noOfCandidates = 3;
        hostelPolls["BRSO"] = BRSO;
        hostelPollCodes.push("BRSO");

        PollStruct memory BRSP;
        BRSP.noOfCandidates = 3;
        hostelPolls["BRSP"] = BRSP;
        hostelPollCodes.push("BRSP");

        PollStruct memory BRTS;
        BRTS.noOfCandidates = 3;
        hostelPolls["BRTS"] = BRTS;
        hostelPollCodes.push("BRTS");

        PollStruct memory CAGS;
        CAGS.noOfCandidates = 3;
        hostelPolls["CAGS"] = CAGS;
        hostelPollCodes.push("CAGS");

        PollStruct memory CAHH;
        CAHH.noOfCandidates = 3;
        hostelPolls["CAHH"] = CAHH;
        hostelPollCodes.push("CAHH");

        PollStruct memory CAHL;
        CAHL.noOfCandidates = 3;
        hostelPolls["CAHL"] = CAHL;
        hostelPollCodes.push("CAHL");

        PollStruct memory CALS;
        CALS.noOfCandidates = 3;
        hostelPolls["CALS"] = CALS;
        hostelPollCodes.push("CALS");

        PollStruct memory CASO;
        CASO.noOfCandidates = 3;
        hostelPolls["CASO"] = CASO;
        hostelPollCodes.push("CASO");

        PollStruct memory CASP;
        CASP.noOfCandidates = 3;
        hostelPolls["CASP"] = CASP;
        hostelPollCodes.push("CASP");

        PollStruct memory CATS;
        CATS.noOfCandidates = 3;
        hostelPolls["CATS"] = CATS;
        hostelPollCodes.push("CATS");

        PollStruct memory GNGS;
        GNGS.noOfCandidates = 3;
        hostelPolls["GNGS"] = GNGS;
        hostelPollCodes.push("GNGS");

        PollStruct memory GNHH;
        GNHH.noOfCandidates = 3;
        hostelPolls["GNHH"] = GNHH;
        hostelPollCodes.push("GNHH");

        PollStruct memory GNHL;
        GNHL.noOfCandidates = 3;
        hostelPolls["GNHL"] = GNHL;
        hostelPollCodes.push("GNHL");

        PollStruct memory GNLS;
        GNLS.noOfCandidates = 3;
        hostelPolls["GNLS"] = GNLS;
        hostelPollCodes.push("GNLS");

        PollStruct memory GNSO;
        GNSO.noOfCandidates = 3;
        hostelPolls["GNSO"] = GNSO;
        hostelPollCodes.push("GNSO");

        PollStruct memory GNSP;
        GNSP.noOfCandidates = 3;
        hostelPolls["GNSP"] = GNSP;
        hostelPollCodes.push("GNSP");

        PollStruct memory GNTS;
        GNTS.noOfCandidates = 3;
        hostelPolls["GNTS"] = GNTS;
        hostelPollCodes.push("GNTS");

        PollStruct memory GDGS;
        GDGS.noOfCandidates = 3;
        hostelPolls["GDGS"] = GDGS;
        hostelPollCodes.push("GDGS");

        PollStruct memory GDHH;
        GDHH.noOfCandidates = 3;
        hostelPolls["GDHH"] = GDHH;
        hostelPollCodes.push("GDHH");

        PollStruct memory GDHL;
        GDHL.noOfCandidates = 3;
        hostelPolls["GDHL"] = GDHL;
        hostelPollCodes.push("GDHL");

        PollStruct memory GDLS;
        GDLS.noOfCandidates = 3;
        hostelPolls["GDLS"] = GDLS;
        hostelPollCodes.push("GDLS");

        PollStruct memory GDSO;
        GDSO.noOfCandidates = 3;
        hostelPolls["GDSO"] = GDSO;
        hostelPollCodes.push("GDSO");

        PollStruct memory GDSP;
        GDSP.noOfCandidates = 3;
        hostelPolls["GDSP"] = GDSP;
        hostelPollCodes.push("GDSP");

        PollStruct memory GDTS;
        GDTS.noOfCandidates = 3;
        hostelPolls["GDTS"] = GDTS;
        hostelPollCodes.push("GDTS");
    }
}
