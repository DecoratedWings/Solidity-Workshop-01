pragma solidity ^0.5.3;

contract StakeV2 { 

   enum Access { AUTH, UNAUTH, ADMIN }
   event isUserValid(bool status);
   
    address payable userAddress; 
    uint monies;
    uint time;
    uint tokenYield;
    //Would be of course best to use an api here:
    uint priceIndex;
    uint amountDays;
   
   struct User {
        address payable userAddress;
        string name;
        uint balance;
        Access access;
    }

//mapping (keyType => valueType)
   mapping(address => string) private addressToUser;
   mapping(string => Access) private nameToAuth;
   
   User[] public user;
   User admin;
   
   constructor() public payable {
        addressToUser[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4] = "mona";
        addressToUser[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = "bob";
        addressToUser[0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678] = "steve";
        nameToAuth["mona"] = Access.AUTH;
        nameToAuth["bob"] = Access.AUTH;
        nameToAuth["steve"] = Access.UNAUTH;
        
        user.push(User(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,"mona",100,Access.AUTH));
        user.push(User(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,"bob",200,Access.AUTH));
        user.push(User(0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678,"steve",300,Access.UNAUTH));
        
        admin = User(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,"admin",0,Access.ADMIN);
   }
   
   
   function addUsers(string memory name, uint balance, Access level) public {
      User memory newUser =  User(msg.sender,name,balance,level);
    
      if(validateUser(newUser)) {
         emit isUserValid(true);
         addressToUser[msg.sender] = name;
         nameToAuth[name] = level;
         user.push(newUser);
      } else{
         emit isUserValid(false);
      }
   }
   
    function validateUser(User memory _user) private pure returns (bool) {
        require(_user.access == Access.AUTH, "User is authorized to stake");
        require(_user.balance > 0, "User has monies in their account");
        return true;
    }
    
    function changePermissions(string memory name, Access level) public {
        require(nameToAuth[addressToUser[msg.sender]] == Access.ADMIN, "Not authorized admin");
        nameToAuth[name] = level;
        for(uint i=0; i<user.length-1; i++){
            if(keccak256(abi.encodePacked(user[i].name)) == keccak256(abi.encodePacked(name))){
                user[i].access = level;
            }
        }
   }
   
    function stakeMonies(uint amount) public returns (uint) {
        require(bytes(addressToUser[msg.sender]).length > 0, 'User does not exist');
        require(nameToAuth[addressToUser[msg.sender]] == Access.AUTH, 'User is not Authorized to Stake');
        monies += amount;
        return monies;
    }

    //Exercise:: incorporate unstake and yield functions from Stake contract into this one
    
}