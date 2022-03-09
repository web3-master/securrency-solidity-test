
// Copyright SECURRENCY INC.
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";

    ///             ///
    ///    Task 2   ///
    ///             ///

/**
 * Test task "Investor registration"
 * A gas usage optimization
 * 
 * function "setLeadInvestorForARound" need to be optimized by a gas usage.
 * current transaction cost > 140 000
 * expected transaction cost < 55 000
 * 
 * Required to save the interface. 
 * All other modifications are allowed.
 **/

struct InvestorInfo {
    address investor;
        uint64 depositAmount;
        uint8 age;
        bool kycStatus;
        bool isVerifiedInverstor;
        bool isUSResident;
}

contract GasUsageOptimisation {
    uint public investmentRound = 1;
    
    // investment round => investors
    mapping(uint=>address) investors;
    // investment round => deposited Amount
    mapping(uint=>uint64) deposits;
    // investment round => age
    mapping(uint=>uint8) investorsAge;
    // investment round => kyc
    mapping(uint=>bool) kyc;
    // investment round => verification status
    mapping(uint=>bool) verificationStatus;
    // investment round => US resident
    mapping(uint=>bool) USResident;

    mapping(uint=>InvestorInfo) data;
    
    /**
     * @notice Lead investor registration
     * 
     * @param investor A lead investor address
     * @param depositAmount The amount deposited by a investor
     * @param age Investor age
     * @param kycStatus Investor KYC status
     * @param isVerifiedInverstor Investor verification status
     * @param isUSResident Resident status
     **/
    function setLeadInvestorForARound(
        address investor,
        uint64 depositAmount,
        uint8 age,
        bool kycStatus,
        bool isVerifiedInverstor,
        bool isUSResident
    )
        external
    {
        // require(investor != address(0x00), "Invalid investor address");
        require(depositAmount > 0, "A deposint amount should be more than zero");
        require(age > 18, "The investor should be adult");
        
        data[investmentRound] = InvestorInfo(
            investor, depositAmount, age, kycStatus,isVerifiedInverstor, isUSResident
        );
        // investors[investmentRound] = investor;
        // deposits[investmentRound] = depositAmount;
        // investorsAge[investmentRound]  = age;
        // kyc[investmentRound] = kycStatus;
        // verificationStatus[investmentRound] = isVerifiedInverstor;
        // USResident[investmentRound] = isUSResident;
        
        investmentRound++;
    }
    
    /**
     * @notice Returns a lead investor details
     **/
    function getInvestorDetailsByInvestmentRound(
        uint round
    )
        external
        view
        returns (
            address investor,
            uint64 depositAmount,
            uint8 age,
            bool kycStatus,
            bool isVerifiedInverstor,
            bool isUSResident
        )
    {
        return (
            investors[round],
            deposits[round],
            investorsAge[round],
            kyc[round],
            verificationStatus[round],
            USResident[round]
        );
    }
}