/* global describe it before ethers */
const { assert } = require("chai");
const { utils } = require("ethers");
const { ethers } = require("hardhat");

describe("StackOverflow test", async function () {
  let tx;
  let stackOverflowContract;

  before(async function () {
    const StackOverflowContract = await ethers.getContractFactory(
      "StackOverflow"
    );
    stackOverflowContract = await StackOverflowContract.deploy();
    await stackOverflowContract.deployed();
    console.log("StackOverflow deployed:", stackOverflowContract.address);
  });

  it("createAsset", async () => {
    const assetInfo = {
      currency: ethers.constants.AddressZero,
      settlementCurrency: ethers.constants.AddressZero,
      marketObjectCodeRateReset: utils.formatBytes32String("Test"),
      contractDealDate: 0,
      statusDate: 0,
      initialExchangeDate: 0,
      maturityDate: 0,
      purchaseDate: 0,
      capitalizationEndDate: 0,
      cycleAnchorDateOfInterestPayment: 0,
      cycleAnchorDateOfRateReset: 0,
      cycleAnchorDateOfScalingIndex: 0,
      cycleAnchorDateOfFee: 0,
      notionalPrincipal: 0,
      nominalInterestRate: 0,
      accruedInterest: 0,
      rateMultiplier: 0,
    };
    tx = await stackOverflowContract.createAsset(assetInfo);
    await tx.wait();
  });
});
