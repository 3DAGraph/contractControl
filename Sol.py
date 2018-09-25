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

print("luck0.1 state:",Solidity.Gunabione("search_L1",0))
profit = Solidity.Gunprofit("0x3Ee8ae904830A51A4cBF7588B02f05a33f870576")
print("0x3Ee8ae904830A51A4cBF7588B02f05a33f870576收益:",profit)
layermap = Solidity.Gunlayermap("0xca35b7d915458ef540ade6068dfe2f44e8fa733c")
print("0xca35b7d915458ef540ade6068dfe2f44e8fa733c上線:",layermap)

