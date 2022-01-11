pragma solidity ^0.5.3;

contract StakeV2 { 

   enum Access { AUTH, UNAUTH, ADMIN }
   event isUserValid(bool status);
   
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
        addressToUser[0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c] = "admin";

        nameToAuth["mona"] = Access.AUTH;
        nameToAuth["bob"] = Access.AUTH;
        nameToAuth["steve"] = Access.UNAUTH;
        nameToAuth["admin"] = Access.ADMIN;

        user.push(User(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,"mona",100,Access.AUTH));
        user.push(User(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,"bob",200,Access.AUTH));
        user.push(User(0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678,"steve",300,Access.UNAUTH));
        
        admin = User(0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c,"admin",0,Access.ADMIN);
        user.push(admin);
   }
   
}