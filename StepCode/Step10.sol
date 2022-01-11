pragma solidity ^0.5.3;

contract Stake { 

    address payable userAddress; 
    uint monies;
    uint time;
    uint tokenYield;
    //Would be of course best to use an api here:
    uint priceIndex;
    uint amountDays;
    
    constructor() public {
        userAddress =0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
        priceIndex=35;
    }
    
    function stakeMonies(uint amount) public returns (uint) {
        require(msg.sender == userAddress, 'User is not Authorized to Stake');
        monies += amount;
        return monies;
    }
    
    function unstakeV2(uint _amount) public returns(uint) {
        require(msg.sender == userAddress, 'User is not Authorized to unStake');
        require(_amount <= monies, 'Cannot withdraw more than what is present.');
        monies -= _amount;
        if(monies==0){
            amountDays=0;
            tokenYield=0;
        }
    }

    function stakeLapse() public returns (uint) { 
         amountDays += 90;
         return yieldGenerator();
    }
    
    function yieldGenerator() private returns (uint) {
        // days/360 * APY *tokenPrice 
        uint apyAmount = (monies*20/100);
        tokenYield = ((amountDays*100/360) * apyAmount * priceIndex)/100000;
        monies+=tokenYield;
        return tokenYield;
    }
    
    function getEarnings() public view returns(uint, uint, uint){
        return (monies, tokenYield, amountDays);
    }
    
}