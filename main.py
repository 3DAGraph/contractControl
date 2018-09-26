import Sign
import Sol

class Main:
    def GunTest():
        address = ["0x5bdb778c1b72743eb8e4ce3a0ac9ad85850cca1e","0xb95bdda056d888e8878c710f0c62ee00130e631d","0xda143daf01112e802294c39def9dd78046cfdd8e","0x9325f086e17c0dfdf9fd25cc23454cca2af967ce","0xc520f4363781a46102cdfa2525d436b6bb86254f","0xd045395cd8a35b31c3e913f8a4e7be5293c252ea","0xe034902f4d6e7006d0208ac990f26fe2552e8053"]
        prikey = ["0x57d927b7aace274748d0893f189597fb1275b405c279767a0719f2b30ed9ba54","0x77e7f5b673e048cbdddb556597c9369969ae599e2e7d3977ed3e05950d44500a","0xb502784f26f8027cd3a82f36e94d4ef6c9199f0176ee2bf74c720e05f3a01356","0x065d9a60d94231a88a3457d2d83886a3a6bf172b4589eafb1a15face43c0deb2","0xe1a2288e57072c781f9c15d3f9e1f118796559425eda127afeb2680e1ea16229","0x422c36198d8f8c16a632cac459fa8d86e71359be4b2556f23184cdae05d72482","0xf2101a5e76a30d77a2f137cdac36ad5a9b3c7f29ea3b3cd000a60b4c53ac0da7"]
        value = [10**17, 10**18]
        for i2,amount in enumerate(value):#range(0, 1):  
            for i in range(0, 6):
                nonce = Sign.Transaction.Nonce(address[i])+i2
                t = Sign.Transaction.ExpTransaction(nonce,amount)
                signresult =Sign.Transaction.Sign(t,prikey[i])
                broadcastresult = Sign.Transaction.Broadcast(signresult)
                print(broadcastresult )
    def GunSolTest():
        print("池子數量：",Sol.Solidity.Gunabizero("pooln_lucky1"))
        print("池子玩家：","5",Sol.Solidity.Gunabione("pool_lucky1",5))
        print("luck0.1 state:",Sol.Solidity.Gunabione("search_L1",0))
        profit = Sol.Solidity.Gunprofit("0x3Ee8ae904830A51A4cBF7588B02f05a33f870576")
        print("0x3Ee8ae904830A51A4cBF7588B02f05a33f870576收益:",profit)
        layermap = Sol.Solidity.Gunlayermap("0xca35b7d915458ef540ade6068dfe2f44e8fa733c")
        print("0xca35b7d915458ef540ade6068dfe2f44e8fa733c上線:",layermap)
#Main.GunTest()
Main.GunSolTest()

