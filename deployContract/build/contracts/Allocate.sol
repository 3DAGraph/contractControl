
    pragma solidity ^0.4.21;

contract Allocate {
    address a = address(0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92);

    address b = address(0x5bdb778c1b72743eb8e4ce3a0ac9ad85850cca1e);

    address c = address(0xb95bdda056d888e8878c710f0c62ee00130e631d);

    address d = address(0xda143daf01112e802294c39def9dd78046cfdd8e);

    address e = address(0x9325f086e17c0dfdf9fd25cc23454cca2af967ce);

    address f = address(0xc520f4363781a46102cdfa2525d436b6bb86254f);

    address g = address(0xd045395cd8a35b31c3e913f8a4e7be5293c252ea);

    address h = address(0xe034902f4d6e7006d0208ac990f26fe2552e8053);

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
        if(msg.value < 0.1 ether){
            address(i).transfer(0.025 ether);
        }
        if(msg.value == 1 wei){
            allocate();
        }
    }
}
