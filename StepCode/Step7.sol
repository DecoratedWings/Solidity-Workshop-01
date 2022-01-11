pragma solidity ^0.5.3; 

//import 
import "github.com/provable-things/ethereum-api/blob/master/oraclizeAPI_0.5.sol";


contract BankAccount is usingOraclize {
    
    event hasMoney(bool val);
    string user = "Customer Balance is: ";
    int balance = 700;
    string info;

    function getBalance() public view returns (int){
        return balance;
    }
    function increaseBalance(int _amount) public returns(int){
        balance += _amount;
    }
    function decreaseBalance(int _amount) public returns(int){
        // uint temp = balance - _amount;
        balance-=_amount;
        emit hasMoney(balance>0);        
        require(balance >= 0, 'Cannot have negative balance');
        return balance;
    }
    

    function concatInfo() public returns (string memory){
        string memory balanceString = uint2str(uint(balance));
        info = string(abi.encodePacked(user," ",balanceString));
        return info;
    }
    
}

////Speaker Notes:
//========
//There are not as elegant string manipulation as with java 
//Must import specific libraries that happen to handle it or write 
//your own method 

//step 1 we will import the following library
//Step 2 there is a method called uint2str() 
    //We first will use this to convert our balance to a string
//step 3 another method abi.encodePacked()
//ABI -> Application Binary Interface 
//encodePacked -> normally handled by compiler 
//we are encoding both variables to lowest level and then typecasting
//back to a string to store in our string info


//Callbacks appeared bc we are using a solidity library