from web3 import Web3
import Config
#import Gunabi
net =  Config.Net.Set()["net"]
web3 = Web3(Web3.HTTPProvider(net))

class Transaction:
    def ExpTransaction(nonce,amount):
        return {
            'to':web3.toChecksumAddress('0xbcBAED7E6D96610347C612A248D6b6D5Ddcf3040'),
            #'value': 101*1000000000000000,#(10*(10**17)),
              #'value': 1010*100000000000000,#(10*(10**17)),
            'value': amount,#10**17,
            #'value':10**18,
            'gas': 3000000,
            'gasPrice': 10**10,
            'nonce':nonce
        }
    def Sign(transaction, key):
        signed = web3.eth.account.signTransaction(transaction, key)
        return signed.rawTransaction
    def Broadcast(raw):
        try:
            return web3.eth.sendRawTransaction(raw)
        except Exception as e:
            return str(e)
    def Nonce(address):
        reAddress = web3.toChecksumAddress(address)
        return web3.eth.getTransactionCount(reAddress)
"""
greeter = web3.eth.contract(
    address="0xbcBAED7E6D96610347C612A248D6b6D5Ddcf3040",
    abi=Abi.Abi.Gunabi()['abi'],
)
print(greeter.functions.search_L1(0).call())
"""

"""
address = ["0x5bdb778c1b72743eb8e4ce3a0ac9ad85850cca1e","0xb95bdda056d888e8878c710f0c62ee00130e631d","0xda143daf01112e802294c39def9dd78046cfdd8e","0x9325f086e17c0dfdf9fd25cc23454cca2af967ce","0xc520f4363781a46102cdfa2525d436b6bb86254f","0xd045395cd8a35b31c3e913f8a4e7be5293c252ea","0xe034902f4d6e7006d0208ac990f26fe2552e8053"]
prikey = ["0x57d927b7aace274748d0893f189597fb1275b405c279767a0719f2b30ed9ba54","0x77e7f5b673e048cbdddb556597c9369969ae599e2e7d3977ed3e05950d44500a","0xb502784f26f8027cd3a82f36e94d4ef6c9199f0176ee2bf74c720e05f3a01356","0x065d9a60d94231a88a3457d2d83886a3a6bf172b4589eafb1a15face43c0deb2","0xe1a2288e57072c781f9c15d3f9e1f118796559425eda127afeb2680e1ea16229","0x422c36198d8f8c16a632cac459fa8d86e71359be4b2556f23184cdae05d72482","0xf2101a5e76a30d77a2f137cdac36ad5a9b3c7f29ea3b3cd000a60b4c53ac0da7"]
value = [10**17, 10**18]
for i2,amount in enumerate(value):#range(0, 1):  
    for i in range(0, 6):
        nonce = Transaction.Nonce(address[i])+i2
        t = Transaction.ExpTransaction(nonce,amount)
        signresult =Transaction.Sign(t,prikey[i])
        broadcastresult = Transaction.Broadcast(signresult)
        print(broadcastresult )
"""

#trans = Transaction.ExpTransaction()
#key = '0x4c0883a69102937d6231471b5dbb6204fe5129617082792ae468d01a3f362318'
#result = Transaction.Sign(trans,key)
#Transaction.Broadcast(result)
#print(signed)
#web3.eth.sendRawTransaction(signed.rawTransaction)
