import Sign
import Sol
import sys
from web3 import Web3
class Main:
    def GunTest():
        address = ["0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92","0x5bdb778c1b72743eb8e4ce3a0ac9ad85850cca1e","0xb95bdda056d888e8878c710f0c62ee00130e631d","0xda143daf01112e802294c39def9dd78046cfdd8e","0x9325f086e17c0dfdf9fd25cc23454cca2af967ce","0xc520f4363781a46102cdfa2525d436b6bb86254f","0xd045395cd8a35b31c3e913f8a4e7be5293c252ea","0xe034902f4d6e7006d0208ac990f26fe2552e8053"]
        prikey = ["116f08538a9373d8bc0b174f65bea2744aca4f0fc41eecea15d5851c4b19c02c","0x57d927b7aace274748d0893f189597fb1275b405c279767a0719f2b30ed9ba54","0x77e7f5b673e048cbdddb556597c9369969ae599e2e7d3977ed3e05950d44500a","0xb502784f26f8027cd3a82f36e94d4ef6c9199f0176ee2bf74c720e05f3a01356","0x065d9a60d94231a88a3457d2d83886a3a6bf172b4589eafb1a15face43c0deb2","0xe1a2288e57072c781f9c15d3f9e1f118796559425eda127afeb2680e1ea16229","0x422c36198d8f8c16a632cac459fa8d86e71359be4b2556f23184cdae05d72482","0xf2101a5e76a30d77a2f137cdac36ad5a9b3c7f29ea3b3cd000a60b4c53ac0da7"]
        value = [5*10**16]
        #value = [5*10**16 ], [10**17] #,0, 10**18, 1001000000000000000, 101000000000000000, 7]
        for i2,amount in enumerate(value):#range(0, 1):  
            for i in range(0, 6):
                nonce = Sign.Transaction.Nonce(address[i])+i2
                t = Sign.Transaction.ExpTransaction(nonce,amount)
                signresult =Sign.Transaction.Sign(t,prikey[i])
                broadcastresult = Sign.Transaction.Broadcast(signresult)
                print(broadcastresult )
        
    def GunSolTest():
        print("L1 樂透獎金：",Sol.Solidity.Gunabizero("lotterybalance_L1"))
        print("L10樂透獎金：",Sol.Solidity.Gunabizero("lotterybalance_L10"))
        print("C1 樂透獎金：",Sol.Solidity.Gunabizero("lotterybalance_C1"))
        print("C10樂透獎金：",Sol.Solidity.Gunabizero("lotterybalance_C10"))
        print("團隊獲利：",Sol.Solidity.Gunabizero("getadminProfitout"))
        print("池子數量：",Sol.Solidity.Gunabizero("pooln_lucky1"))
        print("池子玩家：","5",Sol.Solidity.Gunabione("pool_lucky1",5))
        print("Lucky1 state:",Sol.Solidity.Gunabione("search_L1",0))
        print("Lucky10state:",Sol.Solidity.Gunabione("search_L10",0))
        print("Crazy1 state:",Sol.Solidity.Gunabione("search_C1",0))
        print("Crazy10state:",Sol.Solidity.Gunabione("search_C10",0))
       # print("0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92錢：",Sol.Solidity.Gunabione("inquire","0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92"))
       # print("0X5BDB778C1B72743EB8E4CE3A0AC9AD85850CCA1E錢：",Sol.Solidity.Gunabione("inquire","0x5BDB778c1b72743Eb8e4CE3A0AC9AD85850cCA1E"))

        profit = Sol.Solidity.Gunprofit("0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92")
        print("0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92:",profit)
        profit = Sol.Solidity.Gunprofit("0x5bdb778c1b72743eb8e4ce3a0ac9ad85850cca1e")
        print("0x5bdb778c1b72743eb8e4ce3a0ac9ad85850cca1e:",profit)
        profit = Sol.Solidity.Gunprofit("0xb95bdda056d888e8878c710f0c62ee00130e631d")
        print("0xb95bdda056d888e8878c710f0c62ee00130e631d:",profit)
        profit = Sol.Solidity.Gunprofit("0xda143daf01112e802294c39def9dd78046cfdd8e")
        print("0xda143daf01112e802294c39def9dd78046cfdd8e:",profit)
        profit = Sol.Solidity.Gunprofit("0x9325f086e17c0dfdf9fd25cc23454cca2af967ce")
        print("0x9325f086e17c0dfdf9fd25cc23454cca2af967ce:",profit)
        profit = Sol.Solidity.Gunprofit("0xc520f4363781a46102cdfa2525d436b6bb86254f")
        print("0xc520f4363781a46102cdfa2525d436b6bb86254f:",profit)
        profit = Sol.Solidity.Gunprofit("0xd045395cd8a35b31c3e913f8a4e7be5293c252ea")
        print("0xd045395cd8a35b31c3e913f8a4e7be5293c252ea:",profit)

        profit = Sol.Solidity.Gunprofit("0x3Ee8ae904830A51A4cBF7588B02f05a33f870576")
        print("0x3Ee8ae904830A51A4cBF7588B02f05a33f870576收益:",profit)
       
        print("0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92上線資訊：",Sol.Solidity.Gunabione("getlayer","0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92"))
      # print("層次資訊：",Sol.Solidity.Gunabione("getinviteNumber",?))
        print("0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92幾層：",Sol.Solidity.Gunabione("inviteinquire","0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92"))
        
      # address = Web3.toChecksumAddress("0x5bdb778c1b72743eb8e4ce3a0ac9ad85850cca1e")
        print("0x5bdb778c1b72743eb8e4ce3a0ac9ad85850cca1e幾層：",Sol.Solidity.Gunabione("inviteInquire",Web3.toChecksumAddress("0x5bdb778c1b72743eb8e4ce3a0ac9ad85850cca1e")))
      #address = Web3.toChecksumAddress("0xc520f4363781a46102cdfa2525d436b6bb86254f")
        print("0xc520f4363781a46102cdfa2525d436b6bb86254f幾層：",Sol.Solidity.Gunabione("inviteInquire",Web3.toChecksumAddress("0xc520f4363781a46102cdfa2525d436b6bb86254f")))
        print("lotteryC1 贏家：",Sol.Solidity.Gunabizero("lotterywinner_C1"))
        print("0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92的第3個下線及下線數量：",Sol.Solidity.Gunabitwo("downlineSearch","0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92",3))
        print("0xc520f4363781a46102cdfa2525d436b6bb86254f的第3個下線及下線數量：",Sol.Solidity.Gunabitwo("downlineSearch",Web3.toChecksumAddress("0xc520f4363781a46102cdfa2525d436b6bb86254f"),3))
        print("下線struct:",Sol.Solidity.Gunabione("downlineMap","0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92"))



        layermap = Sol.Solidity.Gunlayermap("0xca35b7d915458ef540ade6068dfe2f44e8fa733c")
        print("0xd045395cd8a35b31c3e913f8a4e7be5293c252ea上線:",layermap)
        layermap = Sol.Solidity.Gunlayermap("0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92")
        print("0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92上線:",layermap)
        
        profit = Sol.Solidity.Gunprofit("0xd045395cd8a35b31c3e913f8a4e7be5293c252ea")
        print("0xd045395cd8a35b31c3e913f8a4e7be5293c252ea:",profit)
       #pool_lucky1[pooln_lucky1 - randomLottery(10000,uint(lotteryPeopleNum_L1))].player
        #print("")

if(sys.argv[1]=="0"):
    Main.GunTest()
if(sys.argv[1]=="1"):
    Main.GunSolTest()

