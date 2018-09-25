pragma solidity ^0.4.21;
//import "./Event.sol";
import "./Layer.sol";
import "./Layerprofit.sol";
import "./Random.sol";
import "./Teambonus.sol";
import "./ContractInfo.sol";
contract Lucky10 is layer, layerprofit, random, ContractInfo{
    uint public pooln_lucky10;
    uint public poolp_lucky10=0;
    uint public lotteryinittime_lucky10 = now;
    uint revenul10 = 1 ether;
    struct poolinfo_lucky10{
        address player;
    }
    mapping(uint => poolinfo_lucky10) public pool_lucky10;
    uint public lotterybalance_L10;
    int public lotteryPeopleNum_L10 =1;
    function changeTime_L10(uint target)onlyOwner public{
        lotteryinittime_lucky10 = lotteryinittime_lucky10 -target;
    }
    struct resultInfo_L10{
        uint winner;
        uint loser;
        uint common1;
        uint common2;
        uint common3;
        uint common4;
    }
    mapping(uint => resultInfo_L10) public resultMap_L10;
    function gun_lucky10() public payable returns (address){
            require(msg.value == 1 ether);
            if(now>lotteryinittime_lucky10+21600&&lotteryPeopleNum_L10>1){
                //if(pool_lucky10[pooln_lucky10 - randomLottery(10000,uint(lotteryPeopleNum_L10-1))].player!=0x0000000000000000000000000000000000000000){
                    pool_lucky10[pooln_lucky10 - randomLottery(10000,uint(lotteryPeopleNum_L10-1))].player.transfer(lotterybalance_L10*50/100);
                    lotteryPeopleNum_L10 = 1;
                    lotterybalance_L10 = lotterybalance_L10/2;
                    lotteryinittime_lucky10 = now;
                //}
            }
            pool_lucky10[pooln_lucky10].player = msg.sender;
            profit[contractAddress] = profit[contractAddress]+revenul10*5/1000;
            allocateProfit(1 ether,msg.sender);
            (resultMap_L10[pooln_lucky10%6].winner,
            resultMap_L10[pooln_lucky10%6].loser,
            resultMap_L10[pooln_lucky10%6].common1,
            resultMap_L10[pooln_lucky10%6].common2,
            resultMap_L10[pooln_lucky10%6].common3,
            resultMap_L10[pooln_lucky10%6].common4) = randomNewLucky(1);
            if(pooln_lucky10>=6){
                if(pooln_lucky10%6==0){
                    pool_lucky10[((pooln_lucky10-(pooln_lucky10%6))+resultMap_L10[0].winner)-6].player.transfer(1.2 ether);
                }
                if(pooln_lucky10%6==1){
                    pool_lucky10[((pooln_lucky10-(pooln_lucky10%6))+resultMap_L10[0].loser)-6].player.transfer(1 wei);
                }
                if(pooln_lucky10%6==2){
                    pool_lucky10[((pooln_lucky10-(pooln_lucky10%6))+resultMap_L10[0].common1)-6].player.transfer(1.1 ether);
                }
                if(pooln_lucky10%6==3){
                    pool_lucky10[((pooln_lucky10-(pooln_lucky10%6))+resultMap_L10[0].common2)-6].player.transfer(1.1 ether);
                }
                if(pooln_lucky10%6==4){
                    pool_lucky10[((pooln_lucky10-(pooln_lucky10%6))+resultMap_L10[0].common3)-6].player.transfer(1.1 ether);
                }
                if(pooln_lucky10%6==5){
                    pool_lucky10[((pooln_lucky10-(pooln_lucky10%6))+resultMap_L10[0].common4)-6].player.transfer(1.1 ether);
                }
            }
            lotteryPeopleNum_L10 = lotteryPeopleNum_L10+1;
            lotterybalance_L10 = lotterybalance_L10 + revenul10/60;
            pooln_lucky10 = pooln_lucky10+1;
    }
    
    //目前時間輪、樂透結算輪、.遊戲輪、.遊戲結算輪、合約樂透獎金
    function search_L10(uint target) public constant returns(uint,uint,uint,uint,uint){
        return ((now-lotteryinittime_lucky10)/21600, 0, pooln_lucky10, pooln_lucky10 - pooln_lucky10%6, lotterybalance_L10);
    }
}