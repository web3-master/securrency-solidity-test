/* global describe it before ethers */
const { assert } = require("chai");
const { utils } = require("ethers");
const { ethers } = require("hardhat");

describe("GasUsageOptimisation test", async function () {
  let tx;
  let gasUsageOptimisationContract;

  before(async function () {
    const GasUsageOptimisationContract = await ethers.getContractFactory(
      "GasUsageOptimisation"
    );
    gasUsageOptimisationContract = await GasUsageOptimisationContract.deploy();
    await gasUsageOptimisationContract.deployed();
    console.log(
      "GasUsageOptimisationContract deployed:",
      gasUsageOptimisationContract.address
    );
  });

  it("setLeadInvestorForARound", async () => {
    tx = await gasUsageOptimisationContract.setLeadInvestorForARound(
      ethers.constants.AddressZero,
      1,
      19,
      true,
      true,
      true
    );
    await tx.wait();
  });
});
