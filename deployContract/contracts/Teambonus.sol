pragma solidity ^0.4.21;

import "./Ownable.sol";

contract teambonus is Ownable {

    address contractAddress = 0x3Ee8ae904830A51A4cBF7588B02f05a33f870576;

  function changeAddress(address newAddress) public onlyOwner {
    require(newAddress != address(0));
    contractAddress = newAddress;
  }
  function contractInquire() public constant returns (address){
      return contractAddress;
  }
}