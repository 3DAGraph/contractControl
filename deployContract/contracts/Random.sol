pragma solidity ^0.4.21;



contract random {
    mapping(uint => uint) commonRandom;
    function randomLottery(uint rand, uint amount) constant returns (uint){
        uint winner = uint(keccak256(abi.encodePacked(rand, blockhash(block.number))))%amount;
        return (winner);
    }
    function randomLucky(uint rand) internal constant returns (uint,uint){
        uint winner = uint(keccak256(abi.encodePacked(rand, blockhash(block.number))))%6;
        uint loser = uint(keccak256(abi.encodePacked(winner, blockhash(block.number))))%6;
        if(winner == loser){
            loser = (winner+1)%6;
        }
        return (winner,loser);
    }
    function randomNewLucky(uint rand)  constant returns (uint,uint,uint,uint,uint,uint){
        uint winner = uint(keccak256(abi.encodePacked(rand, blockhash(block.number))))%6;
        uint loser = uint(keccak256(abi.encodePacked(winner, blockhash(block.number))))%6;

        uint count=0;

        if(winner == loser){
            loser = (winner+1)%6;
        }
        for(uint i =0;i<=6;i++){
            if(i!=winner&&i!=loser){
                commonRandom[count] = i;
                count = count+1;
            }
        }
        count = 0;
        return (winner,loser,commonRandom[0],commonRandom[1],commonRandom[2],commonRandom[3]);
    }
    function randomCrazy(uint rand) internal constant returns (uint,uint,uint,uint){
        uint winner = uint(keccak256(abi.encodePacked(rand, blockhash(block.number))))%3;
        uint loser = uint(keccak256(abi.encodePacked(winner, blockhash(block.number-1))))%2;
        uint loser1 = uint(keccak256(abi.encodePacked(winner, blockhash(block.number-2))))%2+2;
        uint loser2 = uint(keccak256(abi.encodePacked(winner, blockhash(block.number-3))))%2+4;
        if(winner == 0){
            if(loser == 0){
                winner = 1;
            }else{
                winner = 0;
            }
        }
        else if(winner == 1){
            if(loser1 == 2){
                winner = 3;
            }else{
                winner = 2;
            }
        }
        else{
            if(loser2 == 4){
                winner = 5;
            }else{
                winner = 4;
            }
        }
        return (winner,loser,loser1,loser2);
    }   
    
}