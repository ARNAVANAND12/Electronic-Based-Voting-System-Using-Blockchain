pragma solidity ^0.5.16;

contract Election {
	

	//model a candidate
	struct Candidate {
      uint id;
      string name;
      uint voteCount;
	}
    // store accounts that have voted
     mapping(address => bool) public voters;
	//strore  candidate
	// fetch candidate
    mapping(uint => Candidate) public candidates;
 	//strore candidate count
     uint public candidatesCount;
	//string public candidate;
	constructor() public {
      addCandidate("Candidate 1");
      addCandidate("Candidate 2");
	//	candidate = "Candidate 1";
	}

	function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint  _candidateId) public {
    //require that a voter haven't voted before
      require(!voters[msg.sender]);
    //require a valid candidate
    require(_candidateId > 0 && _candidateId <=  candidatesCount);
     // record that a voter has voted
      voters[msg.sender] = true;

     //update candidate voteCount
     candidates[_candidateId].voteCount++;
    }
}
