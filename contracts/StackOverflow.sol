// Copyright SECURRENCY INC.
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";

    ///             ///
    ///    Task 3   ///
    ///             ///

struct InterestInfo {
    address currency;
    address settlementCurrency;
    bytes32 marketObjectCodeRateReset;
    uint contractDealDate;
    uint statusDate;
    uint initialExchangeDate;
    uint maturityDate;
    uint purchaseDate;
    uint capitalizationEndDate;
    uint cycleAnchorDateOfInterestPayment;
    uint cycleAnchorDateOfRateReset;
    uint cycleAnchorDateOfScalingIndex;
    uint cycleAnchorDateOfFee;
    int notionalPrincipal;
    int nominalInterestRate;
    int accruedInterest;
    int rateMultiplier;
}

/**
 * This contract should compile
 * A stack overflow issue
 */
contract StackOverflow {
    function createAsset(
        InterestInfo calldata assetInfo
    )
        external
    {
        require(assetInfo.currency != address(0x00), "Invalid currency address");
        require(assetInfo.settlementCurrency != address(0x00), "Invalid settlement currency address");
        require(assetInfo.marketObjectCodeRateReset != bytes32(0x00), "Code rate request is required");
        require(assetInfo.contractDealDate != 0, "Contract deal date can't be empty");
        require(assetInfo.statusDate != 0, "statusDate can't be empty");
        require(assetInfo.initialExchangeDate != 0, "initialExchangeDate can't be empty");
        require(assetInfo.maturityDate != 0, "maturityDate can't be empty");
        require(assetInfo.purchaseDate != 0, "purchaseDate can't be empty");
        require(assetInfo.capitalizationEndDate != 0, "capitalizationEndDate can't be empty");
        require(assetInfo.cycleAnchorDateOfInterestPayment != 0, "cycleAnchorDateOfInterestPayment can't be empty");
        require(assetInfo.cycleAnchorDateOfScalingIndex != 0, "cycleAnchorDateOfScalingIndex can't be empty");
        require(assetInfo.cycleAnchorDateOfFee != 0, "cycleAnchorDateOfFee can't be empty");
        require(assetInfo.notionalPrincipal != 0, "notionalPrincipalnotionalPrincipal can't be empty");
        require(assetInfo.nominalInterestRate != 0, "nominalInterestRate can't be empty");
        require(assetInfo.accruedInterest != 0, "accruedInterest can't be empty");
        require(assetInfo.rateMultiplier != 0, "rateMultiplier can't be empty");
        
        saveDetailsToStorage(
            assetInfo.currency,
            assetInfo.settlementCurrency,
            assetInfo.marketObjectCodeRateReset,
            assetInfo.notionalPrincipal,
            assetInfo.nominalInterestRate,
            assetInfo.accruedInterest,
            assetInfo.rateMultiplier
        );
        
        saveDatesToStorage(
            assetInfo.contractDealDate,
            assetInfo.statusDate,
            assetInfo.initialExchangeDate,
            assetInfo.maturityDate,
            assetInfo.purchaseDate,
            assetInfo.capitalizationEndDate,
            assetInfo.cycleAnchorDateOfInterestPayment,
            assetInfo.cycleAnchorDateOfRateReset,
            assetInfo.cycleAnchorDateOfScalingIndex,
            assetInfo.cycleAnchorDateOfFee
        );
    }
    
    function saveDetailsToStorage(
        address currency,
        address settlementCurrency,
        bytes32 marketObjectCodeRateReset,
        int notionalPrincipal,
        int nominalInterestRate,
        int accruedInterest,
        int rateMultiplier
    )
        internal
    {
        // Mock function
        // skip implementation
    }
    
    function saveDatesToStorage(
        uint contractDealDate,
        uint statusDate,
        uint initialExchangeDate,
        uint maturityDate,
        uint purchaseDate,
        uint capitalizationEndDate,
        uint cycleAnchorDateOfInterestPayment,
        uint cycleAnchorDateOfRateReset,
        uint cycleAnchorDateOfScalingIndex,
        uint cycleAnchorDateOfFee
    )
        internal
    {
        // Mock function
        // skip implementation
    }
}