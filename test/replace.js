/* global describe it before ethers */
const { assert } = require("chai");

describe.only("Replace test", async function () {
  let tx;
  let replaceContract;

  before(async function () {
    const ReplaceContract = await ethers.getContractFactory("Replace");
    replaceContract = await ReplaceContract.deploy();
    await replaceContract.deployed();
    console.log("Replace deployed:", replaceContract.address);
  });

  it("test1", async () => {
    tx = await replaceContract.test1();
    await tx.wait();
  });

  it("test2", async () => {
    tx = await replaceContract.test2();
    await tx.wait();
  });
});
