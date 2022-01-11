pragma solidity ^0.5.3; 

//import 

contract BankAccount {
    string user = "Customer Balance is: ";
    int balance = 700;

    function getBalance() public view returns (int){
        return balance;
    }
    function increaseBalance(int _amount) public returns(int){
        balance += _amount;
    }
    function decreaseBalance(int _amount) public returns(int){
        balance -= _amount;
    }
}

//Speaker Notes:
//========
//Simple version first to show concatentation of numbers