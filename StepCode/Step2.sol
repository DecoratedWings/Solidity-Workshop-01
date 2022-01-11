pragma solidity ^0.5.3; 

//import 

contract Hello {
     string str = "Hello World!";

      function getStr() public view returns (string memory){
         return str;
     }
     
     function setStr(string memory _str) public{
         str = _str;
     }
}
