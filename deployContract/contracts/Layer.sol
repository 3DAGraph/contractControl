pragma solidity ^0.4.21;
import "./Event.sol";
import "./Ownable.sol";
//event RegistEvent(address indexed player, uint registNumber, address upline)
contract layer is Ownable, Event{
    mapping(address => address) public layermap;
    mapping(uint => address) public player;
    
    address public layercontract;

    //分層測試
    
    constructor() public {
        layermap[0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92] = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;
        layermap[0xca35b7d915458ef540ade6068dfe2f44e8fa733c] = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c;
        layermap[0x14723a09acff6d2a60dcdf7aa4aff308fddc160c] = 0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db;
        layermap[0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db] = 0x583031d1113ad414f02576bd6afabfb302140225;
        layermap[0x583031d1113ad414f02576bd6afabfb302140225] = 0xdd870fa1b7c4700f2bd7f44238821c26f7392148;
        layermap[0xdd870fa1b7c4700f2bd7f44238821c26f7392148] = 0x00a0a0dce3ea7b5529b878e1a832362fcffe6510;
        
        layermap[0x3e5c27761215232ca0b298ef87e0cbecbc0da1fd] = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;
    }
    address invester = 0x3Ee8ae904830A51A4cBF7588B02f05a33f870576;
    mapping(uint => address) public inviteNumber;
    mapping(address => uint) public inviteInquire;
    uint public inviteAmount;

    struct downlineStructAddress{
        address downaddress;
    }

    struct downlineStructMap{
        uint downAmount;
        mapping(uint => downlineStructAddress)  downlineNumber;
    }
    
    mapping(address => downlineStructMap) public downlineMap;
    
    //回傳第幾位下線是誰與現有的下線數量
    function downlineSearch(address target,uint downnumber) public constant returns(address,uint){
        return (downlineMap[target].downlineNumber[downnumber].downaddress,downlineMap[target].downAmount);
    }

    function inviteinquire(address target) public constant returns(uint){
        return inviteInquire[target];
    }

    function regist() payable public {
        //註冊費大於0.05
        require(msg.value*100 >= 5 ether);
        //傳輸者必須沒註冊過
        require(inviteInquire[msg.sender] == 0);
        //推薦者不能推薦自己
        require(msg.sender != inviteNumber[(msg.value-0.05 ether)/10000000000]);
        //判斷有無輸入上線

        //require(invite[head] == );
        layermap[msg.sender] = inviteNumber[(msg.value-0.05 ether)/10000000000];

        inviteNumber[inviteAmount]=msg.sender;
        inviteInquire[msg.sender]=inviteAmount;

        downlineMap[inviteNumber[(msg.value-0.05 ether)/10000000000]].downlineNumber[downlineMap[inviteNumber[(msg.value-0.05 ether)/10000000000]].downAmount].downaddress=msg.sender;
        downlineMap[inviteNumber[(msg.value-0.05 ether)/10000000000]].downAmount = downlineMap[inviteNumber[(msg.value-0.05 ether)/10000000000]].downAmount+1;
        
        inviteAmount = inviteAmount+1;
        invester.transfer(msg.value);
        emit RegistEvent(msg.sender, (msg.value-0.05 ether)/10000000000, inviteAmount, layermap[msg.sender]);
    }
    //獲得層次資訊
    function getinviteNumber(uint num) constant public returns (address){
        return inviteNumber[num];
    }
    //獲得層次資訊
    function getlayer(address target) constant public returns (address){
        return layermap[target];

    }

}
