pragma solidity ^0.4.21;
//import "./Event.sol";
import "./Layer.sol";
import "./Layerprofit.sol";
import "./Random.sol";
import "./Teambonus.sol";
import "./ContractInfo.sol";
contract Lucky50 is layer, layerprofit, random, ContractInfo{
    uint public pooln_lucky50;
    uint public poolp_lucky50=0;
    uint public lotteryinittime_lucky50 = now;
    uint revenul50 = 5 ether;
    struct poolinfo_lucky50{
        uint time;
        address player;
    }
    mapping(uint => poolinfo_lucky50) public pool_lucky50;
    mapping(uint => uint) public lotterybalance_L50;
    mapping(uint => uint) public lotteryPeopleNum_L50;
    mapping(uint => address) public winner_L50;
    mapping(uint => address) public loser_L50;
    uint public settle_L50;


    function changeTime_L50(uint target)onlyOwner public{
        lotteryinittime_lucky50 = lotteryinittime_lucky50 +target;
    }
    
    function luckygun_lucky50() public payable returns (address){
            require(msg.value == 5 ether);
            pool_lucky50[pooln_lucky50].player = msg.sender;
            pool_lucky50[pooln_lucky50].time = block.timestamp;
            profit[contractAddress] = profit[contractAddress]+revenul50*5/1000;
            allocateProfit(5 ether,msg.sender);
            pooln_lucky50 = pooln_lucky50+1;
    }
    //目前時間輪、樂透結算輪、.遊戲輪、.遊戲結算輪、合約樂透獎金
    function search_L50(uint target) public constant returns(uint,uint,uint,uint,uint){
        return ((now-lotteryinittime_lucky50)/21600, settle_L50, pooln_lucky50, poolp_lucky50, lotterybalance_L50[target]);
    }

    function lresult_L50(uint target) public constant returns(address,address,uint){
        return (winner_L50[target], loser_L50[target], lotteryPeopleNum_L50[(now-lotteryinittime_lucky50)/21600]);
    }

    function lotteryprofit_lucky50()public{
        if((lotteryinittime_lucky50+21600*(settle_L50+1))<=(now)){
            if(lotteryPeopleNum_L50[settle_L50]!=0){
                winner_L50[randomLottery(10000,lotteryPeopleNum_L50[settle_L50])].transfer(lotterybalance_L50[settle_L50]*15/100);
                loser_L50[randomLottery(10000,lotteryPeopleNum_L50[settle_L50])].transfer(lotterybalance_L50[settle_L50]*35/100);
                lotterybalance_L50[settle_L50+1] = lotterybalance_L50[settle_L50+1] + lotterybalance_L50[settle_L50]/2;
                emit LuckyLotteryEvent(settle_L50,winner_L50[randomLottery(10000,lotteryPeopleNum_L50[settle_L50])],loser_L50[randomLottery(10000,lotteryPeopleNum_L50[settle_L50])],lotterybalance_L50[settle_L50]);
            }else{
                lotterybalance_L50[settle_L50+1] = lotterybalance_L50[settle_L50+1] + lotterybalance_L50[settle_L50];
            }
            settle_L50 = settle_L50+1;
        }
    }

    function luckygunprofit_lucky50() public{
        assert(pooln_lucky50>=poolp_lucky50+6);
        uint winnerl50;
        uint loserl50;
        (winnerl50, loserl50) = randomLucky(1);
        for(uint i = 0;i < 6; i++){
            if(i != winnerl50 && i!= loserl50){
                pool_lucky50[poolp_lucky50+i].player.transfer(5.5 ether);
                emit NProfitEvent(poolp_lucky50+i,msg.sender, 1, 2, 5.5 ether);
            }
            else if(i == winnerl50){
                winner_L50[lotteryPeopleNum_L50[(now-lotteryinittime_lucky50)/21600]] = pool_lucky50[poolp_lucky50+i].player;//
                pool_lucky50[poolp_lucky50+i].player.transfer(6 ether);
                emit NProfitEvent(poolp_lucky50+i,msg.sender, 2, 2, 6 ether);
            }else{
                loser_L50[lotteryPeopleNum_L50[(now-lotteryinittime_lucky50)/21600]] = pool_lucky50[poolp_lucky50+i].player;//
            }
        }
        poolp_lucky50 = poolp_lucky50+6;
        lotteryPeopleNum_L50[(now-lotteryinittime_lucky50)/21600] = lotteryPeopleNum_L50[(now-lotteryinittime_lucky50)/21600]+1;
        lotterybalance_L50[(now-lotteryinittime_lucky50)/21600] = lotterybalance_L50[(now-lotteryinittime_lucky50)/21600] + revenul50/10;
    }
}