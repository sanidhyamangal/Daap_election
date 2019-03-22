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
}
