
class Net:
    def Main():
        return {
                "net":"https://mainnet.infura.io/"
                }
    def Ropsten():
        return {
                "net":"https://ropsten.infura.io/",
                "contract":"0xbcBAED7E6D96610347C612A248D6b6D5Ddcf3040"
                }

    def Set():
        return Net.Ropsten()
