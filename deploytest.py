import Sign

F = open("code.txt","r") 

nonce = Sign.Transaction.Nonce("0x47ED2C6cAE34FDB231B82Ec8D666646085ea3A92")
x = Sign.Transaction.DeployContract(nonce,F.read().strip('\n'))
y = Sign.Transaction.Sign(x,"116f08538a9373d8bc0b174f65bea2744aca4f0fc41eecea15d5851c4b19c02c")
result = Sign.Transaction.Broadcast(y)
try:
    print(result.hex())
except:
    print(result)
