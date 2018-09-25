pragma solidity ^0.4.21;

contract Allocate {
    address a = address(0x20715ED32aa4c815f692b87Ac37A681a7fb39b38);

    address b = address(0x5129d3908627a74b37cef13c272dc77d006ada4d);

    address c = address(0xc366d0f3d87f8344801794e59ec75628437d1d3b);

    address d = address(0xc19157934700f80A837c4Ba69B7eF0C8E53e3CB5);

    address e = address(0x24b470b066945951727e5d736d64fc2058fa7779);

    address f = address(0xf94ca3e3f81e2d013a749d7efa3abcefcd987c99);

    address g = address(0xb2847cb0f30af2141ef94e40d667bff9da27763b);

    address h = address(0x2c2164503B8DCDF7239AE03B308efF25502f8Ed9);

    address i = address(0xb0c49c4d3de822fb89ab58201a27921f55e434bc);

    
    function allocate() public returns (bool){
        uint bal = address(this).balance;
        
        address(a).transfer(bal*999/10000);
        
        address(b).transfer(bal*2997/10000);
        
        address(c).transfer(bal*999/10000);
        
        address(d).transfer(bal*500/10000);
        
        address(e).transfer(bal*250/10000);
        
        address(f).transfer(bal*250/10000);
        
        address(g).transfer(bal*999/10000);
        
        address(h).transfer(bal*1332/10000);
        
        address(i).transfer(bal*1674/10000);
        
        return true; 
        
    }

    function allocate2(uint money) public returns (bool){
        require(msg.sender == 0xadde8a48643a21414435d33df40cbaa84cdd8f41);
        uint bal = money;
        
        address(a).transfer(bal*999/10000);
        
        address(b).transfer(bal*2997/10000);
        
        address(c).transfer(bal*999/10000);
        
        address(d).transfer(bal*500/10000);
        
        address(e).transfer(bal*250/10000);
        
        address(f).transfer(bal*250/10000);
        
        address(g).transfer(bal*999/10000);
        
        address(h).transfer(bal*1332/10000);
        
        address(i).transfer(bal*1674/10000);
        
        return true; 
        
    }
   
    function put() payable public{
        
    }
    
    function () payable public{
        if(msg.value == 1 wei){
            allocate();
        }
    }
}