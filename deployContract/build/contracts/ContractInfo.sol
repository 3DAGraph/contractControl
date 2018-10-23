pragma solidity ^0.4.21;


contract ContractInfo{


    struct adinfo{
        uint win;
        uint lose;
        uint time;
        uint profit;
        uint lottery;
        uint income;
    }

    mapping(address => adinfo) admap;
    
    function setWin(address target)public{
        admap[target].win = admap[target].win + 1;
    }
    function setLose(address target)public{
        admap[target].lose = admap[target].lose + 1;
    }
    function setTime(address target)public{
        admap[target].time = now;
    }
    function setProfit(address target, uint balance)public{
        admap[target].profit = admap[target].profit + balance;
    }
}