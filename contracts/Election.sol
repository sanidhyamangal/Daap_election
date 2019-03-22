pragma solidity ^0.5.0;

contract Election {

  // create a structure for candidate 
  struct Candidate {
    uint id;
    string name; 
    uint voteCount; 
  }

  // mapping for the candidates 
  mapping (uint=>Candidate) public candidates;

  // mapping for voters
  mapping(address => bool) public voters; 

  // candidate count for better lopping
  uint public candidatesCount;
  
  constructor() public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  // function to add a candidate
  function addCandidate(string memory _name) private {
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  // function to vote user
  function vote(uint _candidateId) public {
     require(! voters[msg.sender]); // check of double voting 

     // check wether candidate is valid or not. 
     require(_candidateId > 0 && _candidateId <= candidatesCount);

     // add voters to vote cast array 
     voters[msg.sender] = true;  

     // increase votecount of a candidate
     candidates[_candidateId].voteCount ++;
  }
}
