from web3 import Web3
import Config
net =  Config.Net.Set()["net"]
web3 = Web3(Web3.HTTPProvider("http://192.168.51.203:9999"))#net))

print(web3.eth.blockNumber)
#print(web3.eth.accounts)
"""
print(web3.eth.sendTransaction({
    "from":web3.eth.accounts[0],
    "gaslimit":21000,
    "gasprice":1,
    "value":0,
    "to":web3.eth.accounts[0]})
    )
"""
