// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

import {PreElection} from "../contracts/preElection.sol";

contract AddOtherPolls is PreElection {
    constructor() {
        PollStruct memory AA;
        AA.noOfCandidates = 3;
        centralPolls["AA"] = AA;
        centralPollCodes.push("AA");

        PollStruct memory RA;
        RA.noOfCandidates = 3;
        centralPolls["RA"] = RA;
        centralPollCodes.push("RA");

        PollStruct memory CO;
        CO.noOfCandidates = 3;
        centralPolls["CO"] = CO;
        centralPollCodes.push("CO");

        PollStruct memory CA;
        CA.noOfCandidates = 3;
        centralPolls["CA"] = CA;
        centralPollCodes.push("CA");

        PollStruct memory CL;
        CL.noOfCandidates = 3;
        centralPolls["CL"] = CL;
        centralPollCodes.push("CL");

        PollStruct memory IA;
        IA.noOfCandidates = 3;
        centralPolls["IA"] = IA;
        centralPollCodes.push("IA");

        PollStruct memory SP;
        SP.noOfCandidates = 3;
        centralPolls["SP"] = SP;
        centralPollCodes.push("SP");

        PollStruct memory HA;
        HA.noOfCandidates = 3;
        centralPolls["HA"] = HA;
        centralPollCodes.push("HA");

        PollStruct memory GS;
        GS.noOfCandidates = 3;
        centralPolls["GS"] = GS;
        centralPollCodes.push("GS");

        PollStruct memory AEBT;
        AEBT.noOfCandidates = 3;
        hostelPolls["AEBT"] = AEBT;
        departmentPollCodes.push("AEBT");

        PollStruct memory AEPD;
        AEPD.noOfCandidates = 3;
        hostelPolls["AEPD"] = AEPD;
        departmentPollCodes.push("AEPD");

        PollStruct memory BTBT;
        BTBT.noOfCandidates = 3;
        hostelPolls["BTBT"] = BTBT;
        departmentPollCodes.push("BTBT");

        PollStruct memory BTPD;
        BTPD.noOfCandidates = 3;
        hostelPolls["BTPD"] = BTPD;
        departmentPollCodes.push("BTPD");

        PollStruct memory CEBT;
        CEBT.noOfCandidates = 3;
        hostelPolls["CEBT"] = CEBT;
        departmentPollCodes.push("CEBT");

        PollStruct memory CEPD;
        CEPD.noOfCandidates = 3;
        hostelPolls["CEPD"] = CEPD;
        departmentPollCodes.push("CEPD");

        PollStruct memory CHBT;
        CHBT.noOfCandidates = 3;
        hostelPolls["CHBT"] = CHBT;
        departmentPollCodes.push("CHBT");

        PollStruct memory CHPD;
        CHPD.noOfCandidates = 3;
        hostelPolls["CHPD"] = CHPD;
        departmentPollCodes.push("CHPD");

        PollStruct memory CSBT;
        CSBT.noOfCandidates = 3;
        hostelPolls["CSBT"] = CSBT;
        departmentPollCodes.push("CSBT");

        PollStruct memory CSPD;
        CSPD.noOfCandidates = 3;
        hostelPolls["CSPD"] = CSPD;
        departmentPollCodes.push("CSPD");

        PollStruct memory CYBT;
        CYBT.noOfCandidates = 3;
        hostelPolls["CYBT"] = CYBT;
        departmentPollCodes.push("CYBT");

        PollStruct memory CYPD;
        CYPD.noOfCandidates = 3;
        hostelPolls["CYPD"] = CYPD;
        departmentPollCodes.push("CYPD");

        PollStruct memory EDBT;
        EDBT.noOfCandidates = 3;
        hostelPolls["EDBT"] = EDBT;
        departmentPollCodes.push("EDBT");

        PollStruct memory EDPD;
        EDPD.noOfCandidates = 3;
        hostelPolls["EDPD"] = EDPD;
        departmentPollCodes.push("EDPD");

        PollStruct memory EEBT;
        EEBT.noOfCandidates = 3;
        hostelPolls["EEBT"] = EEBT;
        departmentPollCodes.push("EEBT");

        PollStruct memory EEPD;
        EEPD.noOfCandidates = 3;
        hostelPolls["EEPD"] = EEPD;
        departmentPollCodes.push("EEPD");

        PollStruct memory EPBT;
        EPBT.noOfCandidates = 3;
        hostelPolls["EPBT"] = EPBT;
        departmentPollCodes.push("EPBT");

        PollStruct memory HSBT;
        HSBT.noOfCandidates = 3;
        hostelPolls["HSBT"] = HSBT;
        departmentPollCodes.push("HSBT");

        PollStruct memory HSPD;
        HSPD.noOfCandidates = 3;
        hostelPolls["HSPD"] = HSPD;
        departmentPollCodes.push("HSPD");

        PollStruct memory MSBT;
        MSBT.noOfCandidates = 3;
        hostelPolls["MSBT"] = MSBT;
        departmentPollCodes.push("MSBT");

        PollStruct memory MSPD;
        MSPD.noOfCandidates = 3;
        hostelPolls["MSPD"] = MSPD;
        departmentPollCodes.push("MSPD");

        PollStruct memory MABT;
        MABT.noOfCandidates = 3;
        hostelPolls["MABT"] = MABT;
        departmentPollCodes.push("MABT");

        PollStruct memory MAPD;
        MAPD.noOfCandidates = 3;
        hostelPolls["MAPD"] = MAPD;
        departmentPollCodes.push("MAPD");

        PollStruct memory MEBT;
        MEBT.noOfCandidates = 3;
        hostelPolls["MEBT"] = MEBT;
        departmentPollCodes.push("MEBT");

        PollStruct memory MEPD;
        MEPD.noOfCandidates = 3;
        hostelPolls["MEPD"] = MEPD;
        departmentPollCodes.push("MEPD");

        PollStruct memory MMBT;
        MMBT.noOfCandidates = 3;
        hostelPolls["MMBT"] = MMBT;
        departmentPollCodes.push("MMBT");
        PollStruct memory MMPD;
        MMPD.noOfCandidates = 3;
        hostelPolls["MMPD"] = MMPD;
        departmentPollCodes.push("MMPD");

        PollStruct memory OEBT;
        OEBT.noOfCandidates = 3;
        hostelPolls["OEBT"] = OEBT;
        departmentPollCodes.push("OEBT");

        PollStruct memory OEPD;
        OEPD.noOfCandidates = 3;
        hostelPolls["OEPD"] = OEPD;
        departmentPollCodes.push("OEPD");

        PollStruct memory PHBT;
        PHBT.noOfCandidates = 3;
        hostelPolls["PHBT"] = PHBT;
        departmentPollCodes.push("PHBT");

        PollStruct memory PHPD;
        PHPD.noOfCandidates = 3;
        hostelPolls["PHPD"] = PHPD;
        departmentPollCodes.push("PHPD");

        PollStruct memory AMPD;
        AMPD.noOfCandidates = 3;
        hostelPolls["AMPD"] = AMPD;
        departmentPollCodes.push("AMPD");

        PollStruct memory MTMT;
        MTMT.noOfCandidates = 3;
        hostelPolls["MTMT"] = MTMT;
        departmentPollCodes.push("MTMT");
    }
}
