pragma solidity ^0.4.21;
//import "./Event.sol";
import "./Layer.sol";
import "./Layerprofit.sol";
import "./Random.sol";
import "./Teambonus.sol";
import "./ContractInfo.sol";
contract Crazy50 is layer, layerprofit, random, ContractInfo{
    uint public pooln_Crazy50;
    uint public poolp_Crazy50= 0;
    uint revenuc50 = 5 ether;
    uint public lotteryinittime_Crazy50 = now;
    struct poolinfo_Crazy50{
        uint time;
        address player;
    }

    mapping(uint => poolinfo_Crazy50) public pool_Crazy50;
    mapping(uint => uint) public lotterybalance_C50;
    mapping(uint => address) public winner_C50;
    mapping(uint => uint) public winnerTime_C50;
    uint public settle_C50;

    function changeTime_C50(uint target)onlyOwner public{
        lotteryinittime_Crazy50 = lotteryinittime_Crazy50 +target;
    }

    function crazygun50() payable public returns (address){
            require(msg.value == 5.001 ether);
            pool_Crazy50[pooln_Crazy50].player = msg.sender;
            pool_Crazy50[pooln_Crazy50].time = block.timestamp;
            allocateProfit(5 ether,msg.sender);
            profit[contractAddress] = profit[contractAddress]+revenuc50*5/1000;
            pooln_Crazy50 = pooln_Crazy50+1;
    }
    function search_C50(uint target) public constant returns(uint,uint,uint,uint,uint,address){
        return ((now-lotteryinittime_Crazy50)/21600, settle_C50, pooln_Crazy50, poolp_Crazy50, lotterybalance_C50[target],winner_C50[(now-lotteryinittime_Crazy50)/21600]);
    }
    function crazyprofit_lucky50()public{
        if((lotteryinittime_Crazy50+21600*(settle_C50+1))<=now){
            if(winner_C50[settle_C50]!=0x0000000000000000000000000000000000000000){
                winner_C50[settle_C50].transfer(lotterybalance_C50[settle_C50]/2);
                lotterybalance_C50[settle_C50+1] = lotterybalance_C50[settle_C50+1] + lotterybalance_C50[settle_C50]/2;
            }else{
                lotterybalance_C50[settle_C50+1] = lotterybalance_C50[settle_C50+1] + lotterybalance_C50[settle_C50];                
            }
            emit CrazyLotteryEvent(settle_C50, winner_C50[settle_C50], lotterybalance_C50[settle_C50+1]);
            settle_C50 = settle_C50+1;
        }
    }
    function crazygunprofit50() public{
        assert(pooln_Crazy50>=poolp_Crazy50+6);
        uint winnerc50;
        uint loserc50;
        uint loser2c50;
        uint loser3c50;
        (winnerc50, loserc50, loser2c50, loser3c50) = randomCrazy(1);
        if(winnerTime_C50[(now-lotteryinittime_Crazy50)/21600] < (pool_Crazy50[poolp_Crazy50+5].time- pool_Crazy50[poolp_Crazy50].time)){
            winner_C50[(now-lotteryinittime_Crazy50)/21600] = pool_Crazy50[poolp_Crazy50+5].player;
            winnerTime_C50[(now-lotteryinittime_Crazy50)/21600] = (pool_Crazy50[poolp_Crazy50+5].time- pool_Crazy50[poolp_Crazy50].time);
        }
        for(uint i = 0;i < 6; i++){
            if(i != winnerc50 && i!= loserc50 && i!= loser2c50 && i!= loser3c50){
                pool_Crazy50[poolp_Crazy50+i].player.transfer(7.5 ether);
                emit NProfitEvent(poolp_Crazy50+i,msg.sender, 1, 5, 7.5 ether);
            }
            else if(i == winnerc50){
                pool_Crazy50[poolp_Crazy50+i].player.transfer(13 ether);
                emit NProfitEvent(poolp_Crazy50+i,msg.sender, 2, 5, 13 ether);
            }
        }
        poolp_Crazy50 = poolp_Crazy50+6;
        lotterybalance_C50[(now-lotteryinittime_Crazy50)/21600] = lotterybalance_C50[(now-lotteryinittime_Crazy50)/21600] + revenuc50/10;
    }

}