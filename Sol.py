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
