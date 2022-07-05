//SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

contract HelloInBytes {

    bytes toWhom = "smu";
    bytes h = "Hello ";

    function setWhom() public {
        toWhom = toWhom;
    }

    function getWhom() public view returns(bytes memory) {
        return toWhom;
    }

    function sayHello(bytes memory) view public returns(bytes memory) {
        
        return bytes.concat(h, toWhom);
    }
}
