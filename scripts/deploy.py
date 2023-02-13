from brownie import Moodnet, accounts

def main():
    #admin = accounts[0]
    #soul = Moodnet.deploy({"from": admin})
    #cost = soul.cost()
    #soul.safeMint(accounts[1], "https://gateway.pinata.cloud/ipfs/QmVcHY1ix3dKCtAvzJqEGJv78QSLcJXSpjGk8KZ7UUEEZT", {"from": admin, "value": cost})
    mn = Moodnet[-1]
    print(mn)
    #print(soul.getSoul(accounts[1],int(1)))
    # soul.mint(admin)
