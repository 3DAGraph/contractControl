pragma solidity ^0.4.21;
//import "./Event.sol";
import "./Layer.sol";
import "./Layerprofit.sol";
import "./Random.sol";
import "./Teambonus.sol";
import "./ContractInfo.sol";
contract Lucky1 is layer, layerprofit, random, ContractInfo{
    uint public pooln_lucky1;
    uint public poolp_lucky1=0;
    uint public lotteryinittime_lucky1 = now;
    uint revenul1 = 0.1 ether;
    struct poolinfo_lucky1{
        address player;
    }
    mapping(uint => poolinfo_lucky1) public pool_lucky1;
    uint public lotterybalance_L1; 
    int public lotteryPeopleNum_L1 =1;
    function changeTime_L1(uint target)onlyOwner public{
        lotteryinittime_lucky1 = lotteryinittime_lucky1 -target;
    }
    struct resultInfo_L1{
        uint winner;
        uint loser;
        uint common1;
        uint common2;
        uint common3;
        uint common4;
    }
    mapping(uint => resultInfo_L1) public resultMap_L1;
    function gun_lucky1() public payable returns (address){
            require(msg.value == 0.1 ether);
            if(now>lotteryinittime_lucky1+21600&&lotteryPeopleNum_L1>1){
                if(pool_lucky1[pooln_lucky1 - randomLottery(10000,uint(lotteryPeopleNum_L1))].player!=0x0000000000000000000000000000000000000000){
                    pool_lucky1[pooln_lucky1 - randomLottery(10000,uint(lotteryPeopleNum_L1))].player.transfer(lotterybalance_L1*50/100);
                    lotteryPeopleNum_L1 = 1;
                    lotterybalance_L1 = lotterybalance_L1/2;
                    lotteryinittime_lucky1 = now;
                }
            }
            pool_lucky1[pooln_lucky1].player = msg.sender;
            profit[contractAddress] = profit[contractAddress]+revenul1*5/1000;
            allocateProfit(0.1 ether,msg.sender);
            (resultMap_L1[pooln_lucky1%6].winner,
            resultMap_L1[pooln_lucky1%6].loser,
            resultMap_L1[pooln_lucky1%6].common1,
            resultMap_L1[pooln_lucky1%6].common2,
            resultMap_L1[pooln_lucky1%6].common3,
            resultMap_L1[pooln_lucky1%6].common4) = randomNewLucky(1);
            if(pooln_lucky1>=6){
                if(pooln_lucky1%6==0){
                    pool_lucky1[((pooln_lucky1-(pooln_lucky1)%6)+resultMap_L1[0].winner)-6].player.transfer(0.12 ether);
                }
                if(pooln_lucky1%6==1){
                    pool_lucky1[((pooln_lucky1-(pooln_lucky1)%6)+resultMap_L1[0].loser)-6].player.transfer(1 wei);
                }
                if(pooln_lucky1%6==2){
                    pool_lucky1[((pooln_lucky1-(pooln_lucky1)%6)+resultMap_L1[0].common1)-6].player.transfer(0.11 ether);
                }
                if(pooln_lucky1%6==3){
                    pool_lucky1[((pooln_lucky1-(pooln_lucky1)%6)+resultMap_L1[0].common2)-6].player.transfer(0.11 ether);
                }
                if(pooln_lucky1%6==4){
                    pool_lucky1[((pooln_lucky1-(pooln_lucky1)%6)+resultMap_L1[0].common3)-6].player.transfer(0.11 ether);
                }
                if(pooln_lucky1%6==5){
                    pool_lucky1[((pooln_lucky1-(pooln_lucky1)%6)+resultMap_L1[0].common4)-6].player.transfer(0.11 ether);
                }
            }
            lotteryPeopleNum_L1 = lotteryPeopleNum_L1+1;
            lotterybalance_L1 = lotterybalance_L1 + revenul1/60;
            pooln_lucky1 = pooln_lucky1+1;
    }
    
    //目前時間輪、樂透結算輪、.遊戲輪、.遊戲結算輪、合約樂透獎金
    function search_L1(uint target) public constant returns(uint,uint,uint,uint,uint){
        return ((now-lotteryinittime_lucky1)/21600, 0, pooln_lucky1, pooln_lucky1-pooln_lucky1%6, lotterybalance_L1);
    }
}