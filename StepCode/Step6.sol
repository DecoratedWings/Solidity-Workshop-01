pragma solidity ^0.5.3; 

//import 

contract BankAccount {
    
    event hasMoney(bool val);
    string user = "Customer Balance is: ";
    int balance = 700;

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
        
    }    
}
