pragma solidity ^0.4.21;
//import "./Event.sol";
import "./Layer.sol";
import "./Layerprofit.sol";
import "./Random.sol";
import "./Teambonus.sol";
import "./ContractInfo.sol";
contract Crazy1 is layer, layerprofit, random, ContractInfo{
    uint public pooln_Crazy1;
    uint public poolp_Crazy1=0;
    uint public lotteryinittime_Crazy1 = now;
    uint revenuc1 = 0.1 ether;
    struct poolinfo_Crazy1{
        address player;
    }
    mapping(uint => poolinfo_Crazy1) public pool_Crazy1;
    uint public lotterybalance_C1;
    //用於結算
    //mapping(uint => uint) public initTime_C1;
    uint public initTime_C1;
    //mapping(uint => uint) public winnerTime_C1;
    uint public finalTime_C1 = 0;
    
    uint public unusedTime_C1 =0;
    
    uint public winnerTime_C1 = 0;
    
    uint public lotterywinner_C1=0;
    uint public lotteryloser_C1=0;
    function changeTime_C1(uint target)onlyOwner public{
        lotteryinittime_Crazy1 = lotteryinittime_Crazy1 -target;
    }
    struct resultInfo_C1{
        uint winner;
        uint loser;
        uint loser1;
        uint loser2;
        uint common3;
        uint common4;
    }
    mapping(uint => resultInfo_C1) public resultMap_C1;
    function gun_crazy1() public payable returns (address){
            require(msg.value == 0.101 ether);
            if(now>lotteryinittime_Crazy1+21600&&lotterywinner_C1>1){
                pool_Crazy1[lotterywinner_C1+randomLottery(10000,6)].player.transfer(lotterybalance_C1*50/100);
                lotterybalance_C1 = lotterybalance_C1/2;
                winnerTime_C1 = 1;
                lotteryinittime_Crazy1 = now;
                lotterywinner_C1 =1;
            }
            pool_Crazy1[pooln_Crazy1].player = msg.sender;
            profit[contractAddress] = profit[contractAddress]+revenuc1*5/1000;
            allocateProfit(0.1 ether,msg.sender);
            (resultMap_C1[pooln_Crazy1%6].winner,
            resultMap_C1[pooln_Crazy1%6].loser,
            resultMap_C1[pooln_Crazy1%6].loser1,
            resultMap_C1[pooln_Crazy1%6].loser2,
            resultMap_C1[pooln_Crazy1%6].common3,
            resultMap_C1[pooln_Crazy1%6].common4) = randomNewLucky(1);
            if(pooln_Crazy1>=6){
                if(pooln_Crazy1%6==0){
                    pool_Crazy1[((pooln_Crazy1-pooln_Crazy1%6)+resultMap_C1[0].winner)-6].player.transfer(0.26 ether);
                    initTime_C1 = now;
                }
                if(pooln_Crazy1%6==1){
                    pool_Crazy1[((pooln_Crazy1-pooln_Crazy1%6)+resultMap_C1[0].loser)-6].player.transfer(1 wei);
                    unusedTime_C1 = now;
                }
                if(pooln_Crazy1%6==2){
                    pool_Crazy1[((pooln_Crazy1-pooln_Crazy1%6)+resultMap_C1[0].loser1)-6].player.transfer(1 wei);
                    unusedTime_C1 = now;
                }
                if(pooln_Crazy1%6==3){
                    pool_Crazy1[((pooln_Crazy1-pooln_Crazy1%6)+resultMap_C1[0].loser2)-6].player.transfer(1 wei);
                    unusedTime_C1 = now;
                }
                if(pooln_Crazy1%6==4){
                    pool_Crazy1[((pooln_Crazy1-pooln_Crazy1%6)+resultMap_C1[0].common3)-6].player.transfer(0.15 ether);
                    unusedTime_C1 = now;
                }
                if(pooln_Crazy1%6==5){
                    pool_Crazy1[((pooln_Crazy1-pooln_Crazy1%6)+resultMap_C1[0].common4)-6].player.transfer(0.15 ether);
                    finalTime_C1 = now;
                }

                    if(pooln_Crazy1%6==5&&finalTime_C1-initTime_C1 <= winnerTime_C1){
                        unusedTime_C1 = finalTime_C1-initTime_C1;
                        lotteryloser_C1 = pooln_Crazy1-5;
                    }
                    if(pooln_Crazy1%6==5&&finalTime_C1-initTime_C1 > winnerTime_C1){
                        winnerTime_C1 = finalTime_C1-initTime_C1;
                        lotterywinner_C1 = pooln_Crazy1-5;
                    }
                    if(pooln_Crazy1%6!=5&&finalTime_C1-initTime_C1 > winnerTime_C1){
                        unusedTime_C1 = finalTime_C1-initTime_C1;
                        lotteryloser_C1 = pooln_Crazy1-5;
                    }
                    if(pooln_Crazy1%6!=5&&finalTime_C1-initTime_C1 <= winnerTime_C1){
                        unusedTime_C1 = finalTime_C1-initTime_C1;
                        lotteryloser_C1 = pooln_Crazy1-5;
                    }
            }
            lotterybalance_C1 = lotterybalance_C1 + revenuc1/60;
            pooln_Crazy1 = pooln_Crazy1+1;
    }
    
    //目前時間輪、樂透結算輪、.遊戲輪、.遊戲結算輪、合約樂透獎金
    function search_C1(uint target) public constant returns(uint,uint,uint,uint,uint){
        return ((now-lotteryinittime_Crazy1)/21600, 0, pooln_Crazy1, pooln_Crazy1-pooln_Crazy1%6, lotterybalance_C1);
    }
}