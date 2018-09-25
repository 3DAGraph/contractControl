pragma solidity ^0.4.21;

import "./Random.sol";
import "./Lucky1.sol";
import "./Lucky10.sol";
import "./Lucky50.sol";
import "./Crazy1.sol";
import "./Crazy10.sol";
import "./Crazy50.sol";
import "./Layer.sol";
//contract main is Lucky1, Crazy50{

contract main is Lucky1, Crazy1, Lucky10, Crazy10/*, Crazy50, Lucky50*/{
    uint stopgame=0;
    function backup(uint bal)public{
        require(msg.sender == owner);
        owner.transfer(bal);
    }
    address public lucky1contract;
    //合約觸動事件
    function set_lucky1contract(address target) public{
        require(admin == msg.sender);
        lucky1contract = target;
    }
    function stop(){
        require(admin == msg.sender);
        stopgame = 1;
    }
    function start(){
        require(admin == msg.sender);
        stopgame = 0;
    }
    function ()payable public{
        require(stopgame==0);
        if(msg.value == 5.001 ether){
            //crazygun50();
        }else if (msg.value == 5 ether){
            //luckygun_lucky50();
        }else if (msg.value == 1.001 ether){
        gun_crazy10();
        }else if (msg.value == 1 ether){
         gun_lucky10();
        }else if (msg.value == 0.101 ether){
        gun_crazy1();
        }else if (msg.value == 0.1 ether){
         gun_lucky1();
        }else if (msg.value < 0.1 ether && msg.value >= 0.05 ether){
            regist();
        }else if(msg.value == 0 wei){
            getProfitout();
        }else if(msg.value == 2 wei){
            //luckygunprofit_lucky10();            
        }else if(msg.value == 3 wei){
            //luckygunprofit_lucky50();            
        }else if(msg.value == 4 wei){
            //crazygunprofit1();            
        }else if(msg.value == 5 wei){
            //crazygunprofit10();            
        }else if(msg.value == 6 wei){
            //crazygunprofit50();
        }else if(msg.value == 1 wei){
            //luckygunprofit_lucky1();
        }else if(msg.value == 7 wei){
            getadminProfitout();
        }
    }
}