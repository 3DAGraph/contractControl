pragma solidity ^0.4.21;

import "./Layer.sol";
import "./Teambonus.sol";

contract layerprofit is layer,teambonus{
    mapping(address => uint) public profit;
        //uint allo = 45;
    function inquire(address target) public constant returns(uint){
        return profit[target];
    }

    function getProfitout()public{
        msg.sender.transfer(profit[msg.sender]);
    }
    function getadminProfitout()public{
        contractAddress.transfer(profit[contractAddress]);
    }

    
    //獎金分布測試
    function allocateProfit(uint balance,address player) internal returns (uint){
        address dy = player;
        uint allo = 45;
        for(uint i = 0;i < 7; i++){
            dy = layermap[dy];
            if(dy == 0x0000000000000000000000000000000000000000)break;
            //2%、1%、0.5%、0.4%、0.3%、0.2%、0.1%
            //2%
            if(i == 0){
                //dy.transfer(balance*20/1000);
                profit[dy] = profit[dy]+balance*20/1000;
                allo = allo -20;
            }
            //1%
            else if(i == 1){
                //dy.transfer(balance*10/1000);
                profit[dy] = profit[dy]+balance*10/1000;
                allo = allo - 10;
            }
            //0.5%
            else if(i == 2){
                //dy.transfer(balance*5/1000);
                profit[dy] = profit[dy]+balance*5/1000;
                allo = allo -5;
            }
            //0.4%
            else if(i == 3){
                //dy.transfer(balance*4/1000);
                profit[dy] = profit[dy]+balance*4/1000;
                allo = allo -4;
            }
            //0.3%
            else if(i == 4){
                //dy.transfer(balance*3/1000);
                profit[dy] = profit[dy]+balance*3/1000;
                allo = allo -3;
            }
            //0.2%
            else if(i == 5){
                //dy.transfer(balance*2/1000);
                profit[dy] = profit[dy]+balance*2/1000;
                allo = allo -2;
            }
            //0.1%
            else if(i == 6){
                //dy.transfer(balance*1/1000);
                profit[dy] = profit[dy]+balance*1/1000;
                allo = allo -1;
            }
        }
        profit[contractAddress] = profit[contractAddress]+balance*allo/1000;
        //contractAddress.transfer((balance*allo/1000));
        return msg.value;
    }
    //將分層獎金領出
    /*
    function getProfitout(address target) public{
        return target.transfer(profit[target]);
    }
    */
    
    
}