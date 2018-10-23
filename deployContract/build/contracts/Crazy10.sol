pragma solidity ^0.4.21;
//import "./Event.sol";
import "./Layer.sol";
import "./Layerprofit.sol";
import "./Random.sol";
import "./Teambonus.sol";
import "./ContractInfo.sol";
contract Crazy10 is layer, layerprofit, random, ContractInfo{
    uint public pooln_Crazy10;
    uint public poolp_Crazy10=0;
    uint public lotteryinittime_Crazy10 = now;
    uint revenuc10 = 1 ether;
    struct poolinfo_Crazy10{
        address player;
    }
    mapping(uint => poolinfo_Crazy10) public pool_Crazy10;
    uint public lotterybalance_C10;
    //用於結算
    //mapping(uint => uint) public initTime_C10;
    uint public initTime_C10;
    //mapping(uint => uint) public winnerTime_C10;
    uint public finalTime_C10 = 0;
    
    uint public unusedTime_C10 =0;
    
    uint public winnerTime_C10 = 0;
    
    uint public lotterywinner_C10=0;
    uint public lotteryloser_C10=0;
    function changeTime_C10(uint target)onlyOwner public{
        lotteryinittime_Crazy10 = lotteryinittime_Crazy10 -target;
    }
    struct resultInfo_C10{
        uint winner;
        uint loser;
        uint loser1;
        uint loser2;
        uint common3;
        uint common4;
    }
    mapping(uint => resultInfo_C10) public resultMap_C10;
    function gun_crazy10() public payable returns (address){
            require(msg.value == 1.001 ether);
            if(now>lotteryinittime_Crazy10+21600&&lotterywinner_C10>1){
                pool_Crazy10[lotterywinner_C10+randomLottery(10000,6)].player.transfer(lotterybalance_C10*50/100);
                lotterybalance_C10 = lotterybalance_C10/2;
                winnerTime_C10 = 1;
                lotteryinittime_Crazy10 = now;
                lotterywinner_C10 =1;
            }
            pool_Crazy10[pooln_Crazy10].player = msg.sender;
            profit[contractAddress] = profit[contractAddress]+revenuc10*5/1000;
            allocateProfit(1 ether,msg.sender);
            (resultMap_C10[pooln_Crazy10%6].winner,
            resultMap_C10[pooln_Crazy10%6].loser,
            resultMap_C10[pooln_Crazy10%6].loser1,
            resultMap_C10[pooln_Crazy10%6].loser2,
            resultMap_C10[pooln_Crazy10%6].common3,
            resultMap_C10[pooln_Crazy10%6].common4) = randomNewLucky(1);
            if(pooln_Crazy10>=6){
                if(pooln_Crazy10%6==0){
                    pool_Crazy10[((pooln_Crazy10-(pooln_Crazy10%6))+resultMap_C10[0].winner)-6].player.transfer(2.6 ether);
                    initTime_C10 = now;
                }
                if(pooln_Crazy10%6==1){
                    pool_Crazy10[((pooln_Crazy10-(pooln_Crazy10%6))+resultMap_C10[0].loser)-6].player.transfer(1 wei);
                    unusedTime_C10 = now;
                }
                if(pooln_Crazy10%6==2){
                    pool_Crazy10[((pooln_Crazy10-(pooln_Crazy10%6))+resultMap_C10[0].loser1)-6].player.transfer(1 wei);
                    unusedTime_C10 = now;
                }
                if(pooln_Crazy10%6==3){
                    pool_Crazy10[((pooln_Crazy10-(pooln_Crazy10%6))+resultMap_C10[0].loser2)-6].player.transfer(1 wei);
                    unusedTime_C10 = now;
                }
                if(pooln_Crazy10%6==4){
                    pool_Crazy10[((pooln_Crazy10-(pooln_Crazy10%6))+resultMap_C10[0].common3)-6].player.transfer(1.5 ether);
                    unusedTime_C10 = now;
                }
                if(pooln_Crazy10%6==5){
                    pool_Crazy10[((pooln_Crazy10-(pooln_Crazy10%6))+resultMap_C10[0].common4)-6].player.transfer(1.5 ether);
                    finalTime_C10 = now;
                }

                    if(pooln_Crazy10%6==5&&finalTime_C10-initTime_C10 <= winnerTime_C10){
                        unusedTime_C10 = finalTime_C10-initTime_C10;
                        lotteryloser_C10 = pooln_Crazy10-5;
                    }
                    if(pooln_Crazy10%6==5&&finalTime_C10-initTime_C10 > winnerTime_C10){
                        winnerTime_C10 = finalTime_C10-initTime_C10;
                        lotterywinner_C10 = pooln_Crazy10-5;
                    }
                    if(pooln_Crazy10%6!=5&&finalTime_C10-initTime_C10 > winnerTime_C10){
                        unusedTime_C10 = finalTime_C10-initTime_C10;
                        lotteryloser_C10 = pooln_Crazy10-5;
                    }
                    if(pooln_Crazy10%6!=5&&finalTime_C10-initTime_C10 <= winnerTime_C10){
                        unusedTime_C10 = finalTime_C10-initTime_C10;
                        lotteryloser_C10 = pooln_Crazy10-5;
                    }
            }
            lotterybalance_C10 = lotterybalance_C10 + revenuc10/60;
            pooln_Crazy10 = pooln_Crazy10+1;
    }
    
    //目前時間輪、樂透結算輪、.遊戲輪、.遊戲結算輪、合約樂透獎金
    function search_C10(uint target) public constant returns(uint,uint,uint,uint,uint){
        return ((now-lotteryinittime_Crazy10)/21600, 0, pooln_Crazy10, pooln_Crazy10-pooln_Crazy10%6, lotterybalance_C10);
    }
}