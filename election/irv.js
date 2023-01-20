const { string } = require("hardhat/internal/core/params/argumentTypes");

AKHH = [123, 123, 132, 213, 213, 213, 231, 231, 231, 231, 312, 312, 312, 321, 321, 321];
// 123: 2, 132: 1, 213: 3, 231: 4, 312: 3, 321: 3 
// Since 1 has least 1st pref, 1 is removed, and then
// 23: 9, 32: 7, and hence 2, i.e. NA20B016 should win
noOfCandidates = 3;
let ballots = new Array();

let candidateList = new Map();
candidateList.set('1', 'NA20B007')
candidateList.set('2', 'NA20B016')
candidateList.set('3', 'NA20B020')

for (i=0; i<AKHH.length; i++) {
    AKHH[i] = AKHH[i].toString();
    temp = AKHH[i].split("");
    ballots.push(temp);
}

const irv = (ballots) => {
    const candidates = [... new Set (ballots .flat())]
    const votes = Object .entries (ballots .reduce (
      (votes, [v]) => {votes [v] += 1; return votes},
      Object .assign (... candidates .map (c => ({[c]: 0})))
    ))
    const [topCand, topCount] = 
      votes .reduce (([n, m], [v, c]) => c > m ? [v, c] : [n, m], ['?', -Infinity])
    const [bottomCand, bottomCount] = 
      votes .reduce (([n, m], [v, c]) => c < m ? [v, c] : [n, m], ['?', Infinity])
  
    return topCount > ballots .length / 2 
      ? topCand
      : irv (ballots .map (ballot => ballot .filter (c => c != bottomCand)) .filter (b => b.length > 0))
  }
  
  
  console .log ( candidateList .get (irv (ballots)))
