pragma solidity ^0.4.21;

import "./Ownable.sol";

contract teambonus is Ownable {

    address contractAddress = 0xd30c61cB4DcF77a01c43D13d994Bc64Aaaa7938a;

  function changeAddress(address newAddress) public onlyOwner {
    require(newAddress != address(0));
    contractAddress = newAddress;
  }
  function contractInquire() public constant returns (address){
      return contractAddress;
  }
}
