var Storage = artifacts.require("./main.sol");
module.exports = function(deployer) {
  deployer.deploy(Storage);
};
