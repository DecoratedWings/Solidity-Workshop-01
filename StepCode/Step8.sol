pragma solidity ^0.5.3;

contract Stake { 

    address payable userAddress; 
    //we will remove public in a second
    uint public monies;
    uint public time;
    uint tokenYield;
    //Would be of course best to use an api here:
    uint priceIndex;
    uint amountDays;
    
    constructor() public {
        //paste an address you see in the deploy tab
        userAddress =0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
        priceIndex=35;
    }
    
    function stakeMonies(uint amount) public returns (uint) {
        require(msg.sender == userAddress, 'User is not Authorized to Stake');
        monies += amount;
        return monies;
    }
    
    function timeLapse() public returns (uint) {
        time += 5;
        if(time > 10){
            monies = monies + 1*monies/ 5;
        }
        return monies;
    }
    
}