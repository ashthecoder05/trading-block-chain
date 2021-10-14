var tradingclient = artifacts.require("./tradingclient.sol");

module.exports = function(deployer) {
  deployer.deploy(tradingclient);
};
