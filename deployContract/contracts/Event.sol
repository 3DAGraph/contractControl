pragma solidity ^0.4.21;


contract Event{
    //遊戲獲利事件
    event NProfitEvent(uint pool,address indexed player, uint status, uint types, uint balance);
    //組織獲利事件
    event LProfitEvent(address indexed player, uint balance);
    //註冊事件
    event RegistEvent(address indexed player,uint inputNumber, uint registNumber, address upline);
    //結算事件
    event LuckyProfitEvent(uint pool, uint winner, uint loser);
    event CrazyProfitEvent(uint pool, uint winner, uint loser1, uint loser2, uint loser3);
    //樂透結算
    event LuckyLotteryEvent(uint pool, address winner, address loser, uint balance);
    event CrazyLotteryEvent(uint pool, address winner, uint balance); 
}
