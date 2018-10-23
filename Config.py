from web3 import Web3
web3 = Web3(Web3.HTTPProvider("https://ropsten.infura.io"))


class Net:
    def Main():
        return {
                "net":"https://mainnet.infura.io/"
                }
    def Ropsten():
        return {
                "net":"https://ropsten.infura.io/",
                #"contract": Web3.toChecksumAddress("0x103d7643540dd48800d97a29048a7058542680dbc6b105c98f469d5f3862c3ec")
                "contract": Web3.toChecksumAddress("0xA3601596F3f9181435d8BcF2eB564d192427942B")
                }
    def Testrpc():
        return {
                "net":"http://127.0.0.1:8545",
                "contract": Web3.toChecksumAddress("0x67687cfca900305f64e0efb4fe5545c842fac9f8")
                }
    def Set():
        return Net.Ropsten()
        #return Net.Testrpc()
