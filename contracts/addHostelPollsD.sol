// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

import {PreElection} from "../contracts/preElection.sol";

contract AddHostelPollsD is PreElection {
    constructor() {
        PollStruct memory SNGS;
        SNGS.noOfCandidates = 3;
        hostelPolls["SNGS"] = SNGS;
        hostelPollCodes.push("SNGS");

        PollStruct memory SNHH;
        SNHH.noOfCandidates = 3;
        hostelPolls["SNHH"] = SNHH;
        hostelPollCodes.push("SNHH");

        PollStruct memory SNHL;
        SNHL.noOfCandidates = 3;
        hostelPolls["SNHL"] = SNHL;
        hostelPollCodes.push("SNHL");

        PollStruct memory SNLS;
        SNLS.noOfCandidates = 3;
        hostelPolls["SNLS"] = SNLS;
        hostelPollCodes.push("SNLS");

        PollStruct memory SNSO;
        SNSO.noOfCandidates = 3;
        hostelPolls["SNSO"] = SNSO;
        hostelPollCodes.push("SNSO");

        PollStruct memory SNSP;
        SNSP.noOfCandidates = 3;
        hostelPolls["SNSP"] = SNSP;
        hostelPollCodes.push("SNSP");

        PollStruct memory SNTS;
        SNTS.noOfCandidates = 3;
        hostelPolls["SNTS"] = SNTS;
        hostelPollCodes.push("SNTS");

        PollStruct memory TMGS;
        TMGS.noOfCandidates = 3;
        hostelPolls["TMGS"] = TMGS;
        hostelPollCodes.push("TMGS");

        PollStruct memory TMHH;
        TMHH.noOfCandidates = 3;
        hostelPolls["TMHH"] = TMHH;
        hostelPollCodes.push("TMHH");

        PollStruct memory TMHL;
        TMHL.noOfCandidates = 3;
        hostelPolls["TMHL"] = TMHL;
        hostelPollCodes.push("TMHL");

        PollStruct memory TMLS;
        TMLS.noOfCandidates = 3;
        hostelPolls["TMLS"] = TMLS;
        hostelPollCodes.push("TMLS");

        PollStruct memory TMSO;
        TMSO.noOfCandidates = 3;
        hostelPolls["TMSO"] = TMSO;
        hostelPollCodes.push("TMSO");

        PollStruct memory TMSP;
        TMSP.noOfCandidates = 3;
        hostelPolls["TMSP"] = TMSP;
        hostelPollCodes.push("TMSP");

        PollStruct memory TMTS;
        TMTS.noOfCandidates = 3;
        hostelPolls["TMTS"] = TMTS;
        hostelPollCodes.push("TMTS");

        PollStruct memory TPGS;
        TPGS.noOfCandidates = 3;
        hostelPolls["TPGS"] = TPGS;
        hostelPollCodes.push("TPGS");

        PollStruct memory TPHH;
        TPHH.noOfCandidates = 3;
        hostelPolls["TPHH"] = TPHH;
        hostelPollCodes.push("TPHH");

        PollStruct memory TPHL;
        TPHL.noOfCandidates = 3;
        hostelPolls["TPHL"] = TPHL;
        hostelPollCodes.push("TPHL");

        PollStruct memory TPLS;
        TPLS.noOfCandidates = 3;
        hostelPolls["TPLS"] = TPLS;
        hostelPollCodes.push("TPLS");

        PollStruct memory TPSO;
        TPSO.noOfCandidates = 3;
        hostelPolls["TPSO"] = TPSO;
        hostelPollCodes.push("TPSO");

        PollStruct memory TPSP;
        TPSP.noOfCandidates = 3;
        hostelPolls["TPSP"] = TPSP;
        hostelPollCodes.push("TPSP");

        PollStruct memory TPTS;
        TPTS.noOfCandidates = 3;
        hostelPolls["TPTS"] = TPTS;
        hostelPollCodes.push("TPTS");

        PollStruct memory TUGS;
        TUGS.noOfCandidates = 3;
        hostelPolls["TUGS"] = TUGS;
        hostelPollCodes.push("TUGS");

        PollStruct memory TUHH;
        TUHH.noOfCandidates = 3;
        hostelPolls["TUHH"] = TUHH;
        hostelPollCodes.push("TUHH");
        PollStruct memory TUHL;
        TUHL.noOfCandidates = 3;
        hostelPolls["TUHL"] = TUHL;
        hostelPollCodes.push("TUHL");

        PollStruct memory TULS;
        TULS.noOfCandidates = 3;
        hostelPolls["TULS"] = TULS;
        hostelPollCodes.push("TULS");

        PollStruct memory TUSO;
        TUSO.noOfCandidates = 3;
        hostelPolls["TUSO"] = TUSO;
        hostelPollCodes.push("TUSO");

        PollStruct memory TUSP;
        TUSP.noOfCandidates = 3;
        hostelPolls["TUSP"] = TUSP;
        hostelPollCodes.push("TUSP");

        PollStruct memory TUTS;
        TUTS.noOfCandidates = 3;
        hostelPolls["TUTS"] = TUTS;
        hostelPollCodes.push("TUTS");
    }
}
