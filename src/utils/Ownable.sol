// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

abstract contract Ownable {

    event OwnershipTransferred(address indexed user, address indexed newOwner);
     // -note: Its very easy to reterive the address of owner beause it will store on 0th slot .
     // Then can transfer the ownership .
    address public owner;
       // : ok
    modifier onlyOwner() virtual {
        require(msg.sender == owner, "UNAUTHORIZED");
        _;
    }

    // : ok
    constructor(address _owner) {
        owner = _owner;
        emit OwnershipTransferred(address(0), _owner);
    }
  
     // :ok
    function transferOwnership(address _owner) public virtual onlyOwner {
        owner = _owner;
        emit OwnershipTransferred(msg.sender, _owner);
    }
}