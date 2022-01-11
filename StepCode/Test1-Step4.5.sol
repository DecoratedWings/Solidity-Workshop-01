// SPDX-License-Identifier: GPL-3.0
    
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "./BankAccount.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite is BankAccount {
     BankAccount bank;
     int expected;
    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeEach() public {
        // <instantiate contract>
        // Assert.equal(uint(1), uint(1), "1 should be equal to 1");
       bank = new BankAccount(); 
       expected = bank.getBalance();
    }
    
    function checkBalance() public {
        Assert.equal(BankAccount.getBalance(), 700, "initial balance");
    }
    
    function checkIncrease() public {
        // int expected = bank.getBalance();
        bank.increaseBalance(200);
        int actual = bank.getBalance();
        Assert.greaterThan(actual, expected, "balance was increased");
        Assert.equal(actual, 900, "increase initial 700 by 200");
    }
    
    //Exercise: write function to checkDecrease()
    function checkDecrease() public {
        // int expected = bank.getBalance();
        bank.decreaseBalance(100);
        int actual = bank.getBalance();
        Assert.lesserThan(actual, expected, "balance was decreased");
        Assert.equal(actual, 600, "decrease initial 700 by 100");
    }
    
    function concatChecker() public {
        // string memory actual = BankAccount.concatInfo();
        bytes memory expected = abi.encodePacked(" Customer Balance is: 700");
        bytes memory actual = abi.encodePacked(BankAccount.concatInfo());
        Assert.equal(expected.length, actual.length, "concatenation occurred");
    }
    
}
