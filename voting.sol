pragma solidity >=0.6.6 < 0.8.0;
contract Voting {
    mapping (string => uint) votesReceived;
    string[] public candidateList = ["Prayuth", "Prawitr", "Apirath"];
    /*function setCandidate(string memory candidate) public {
      candidateList.push(candidate);
  }*/

  // This function returns the total votes a candidate has received so far
  function totalVotesFor(string memory candidate) public view returns (uint256) {
    return votesReceived[candidate];
  }

  // This function increments the vote count for the specified candidate. This
  // is equivalent to casting a vote
  function voteForCandidate(string memory candidate) public {
    //require(!voters[msg.sender]);   
    votesReceived[candidate] += 1;
    //voters[msg.sender] = true;
  }
  
  function candidateCount() public view returns (uint256) {
      return candidateList.length;
  }
  function getCandidate(uint index) public view returns (string memory) {
      return candidateList[index];
  } 
  function clearVote() public {
      for (uint i =0; i < candidateList.length; i++) {
          votesReceived[candidateList[i]] = 0;
      }
      
      
  }
}