pragma solidity ^0.5.3; 

//import 

contract Hello {
    
    //Function driven hello world
    function helloWorld() public pure returns (string memory) {
        return "Hello, World!";
    }
}

//Speaker Notes:
//========
//restricting to function call 
//Local variable as opposed to global