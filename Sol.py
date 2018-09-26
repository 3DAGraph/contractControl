from web3 import Web3
import Config
import Gunabi
net =  Config.Net.Set()["net"]
web3 = Web3(Web3.HTTPProvider(net))
greeter = web3.eth.contract(
    address=Config.Net.Set()["contract"],
    abi=Gunabi.Abi.Gunabi()['abi'],
)

class Solidity:
    def Gunabizero(func):
        return greeter.functions[func]().call()
    def Gunabione(func,argv):
        return greeter.functions[func](argv).call()
    def Gunabitwo(func,argv1,argv2):
        return greeter.functions[func](argv1,argv2).call()
    def Gunabithree(func,argv1,argv2,argv3):
        return greeter.functions[func](argv1,argv2,argv3).call()
    def Gunabi():
        return greeter.functions.pooln_lucky1().call()
    def Gunprofit(target):
        return greeter.functions.profit(Web3.toChecksumAddress(target)).call()
    def Gunlayermap(target):
        return greeter.functions.layermap(Web3.toChecksumAddress(target)).call()
#print("查詢獎金：","0x3Ee8ae904830A51A4cBF7588B02f05a33f870576",Solidity.Gunabione("inquire","0x3Ee8ae904830A51A4cBF7588B02f05a33f870576"))    
#print("獲得獎金：",Solidity.Gunabizero("getProfitout"))
#print("獲得獎金：",Solidity.Gunabizero("getadminProfitout"))
#print("分層獎金：",Solidity.Gunabitwo("allocateProfit",0.1,"0x3Ee8ae904830A51A4cBF7588B02f05a33f870576"))
print("池子數量：",Solidity.Gunabizero("pooln_lucky1"))
print("池子玩家：","5",Solidity.Gunabione("pool_lucky1",5))
print("luck0.1 state:",Solidity.Gunabione("search_L1",0))
profit = Solidity.Gunprofit("0x3Ee8ae904830A51A4cBF7588B02f05a33f870576")
print("0x3Ee8ae904830A51A4cBF7588B02f05a33f870576收益:",profit)
layermap = Solidity.Gunlayermap("0xca35b7d915458ef540ade6068dfe2f44e8fa733c")
print("0xca35b7d915458ef540ade6068dfe2f44e8fa733c上線:",layermap)

