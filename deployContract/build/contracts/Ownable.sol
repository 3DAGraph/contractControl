pragma solidity ^0.4.18;

contract Ownable {
  address public owner;
  address public admin;
  function Ownable() public {
    owner = msg.sender;
    admin = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    owner = newOwner;
  }
  function transferAdmin(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    admin = newOwner;
  }
}