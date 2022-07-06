//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract BankV2 {
    address owner; //from 0.8.0 no need to declare the address as payable explicitly
    uint balance; 
    constructor() payable { // warning: from 0.7? remove public -> constructor() payable
        owner = msg.sender;
        balance = 0;
    }
    event Sent(address from, address to, uint amount );  // to learn next week
    //function send(address payable _receiver, uint _amount) public payable {
    function forwardTo(address payable _receiver) public payable {
        //balance -= msg.value;
        require(msg.sender == owner);
        _receiver.transfer(msg.value);
        emit Sent(msg.sender, _receiver, msg.value);  // event
    }
    function getBalance() public view returns(uint, uint) {
        return (balance, address(this).balance);
    }
    function deposit(uint amount) public payable {
        require(msg.value == amount);
        balance += amount;
    }
    function widthdrawAll() public {
        balance -= address(this).balance;
        require(msg.sender == owner);
        //owner.transfer(address(this).balance); //error pyable
        //payable(msg.sender).transfer(address(this).balance); //ok
        payable(owner).transfer(address(this).balance); //to use payable from 0.8.0 (but error with 0.5)
    }
}
