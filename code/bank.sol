//SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

contract bank {
    address owner;
    uint balance;
    
    event PrintLog(address from, uint amount);
    //event PrintLog(address from, address to, uint amount );
    
    constructor() public {
        owner = msg.sender;
        balance = 0;
    }

    receive() external payable {
        uint amount = msg.value;
        balance += amount;
        emit PrintLog(msg.sender,msg.value);
    }

    function forwardTo(address payable _receiver) public payable {
        _receiver.transfer(msg.value);
        balance -= msg.value;
    }

    function getBalance() public view returns(uint, uint) {
        return (balance, address(this).balance);
    }

    function deposit(uint amount) public payable {
        require(msg.value == amount);
        balance += amount;
    }

    function withdrawAll() public {
        balance -= address(this).balance;
        msg.sender.transfer(address(this).balance); 
    }
}
