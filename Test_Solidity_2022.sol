// Copyright SECURRENCY INC.
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


    ///             ///
    ///    Task 1   ///
    ///             ///
    
/**
 * The tester's task is to write a function that searches for provided values in the string and replaces all of them
 * Interfaces should not be changed
 * Try to write the code with the lowest gas consumption you can
 * If you will use external libraries or "StackOverflow" examples, please put the links here
 * Functions "test1" and "test2" must not revert
 */
contract Replace {

    function replace(string memory input, string memory stringToSearch, string memory stringToReplace) public pure returns (string memory) {
        // Write your code here
    }
    
    function test1() external pure {
        string memory result = replace("one two one two on e ononee", "one", "three");
        string memory expected = "three two three two on e onthreee";
        require(
            keccak256(bytes(result)) == keccak256(bytes(expected)),
            "Wrong result test 1"
        );
    }

    function test2() external pure {
        string memory result = replace("1 2 3", " ", ",");
        string memory expected = "1,2,3";
        require(
            keccak256(bytes(result)) == keccak256(bytes(expected)),
            "Wrong result test 2"
        );
    }
}

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
        require(investor != address(0x00), "Invalid investor address");
        require(depositAmount > 0, "A deposint amount should be more than zero");
        require(age > 18, "The investor should be adult");
        
        investors[investmentRound] = investor;
        deposits[investmentRound] = depositAmount;
        investorsAge[investmentRound]  = age;
        kyc[investmentRound] = kycStatus;
        verificationStatus[investmentRound] = isVerifiedInverstor;
        USResident[investmentRound] = isUSResident;
        
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

    ///             ///
    ///    Task 3   ///
    ///             ///

/**
 * This contract should compile
 * A stack overflow issue
 */
contract StackOverflow {
    function createAsset(
        address currency,
        address settlementCurrency,
        bytes32 marketObjectCodeRateReset,
        uint contractDealDate,
        uint statusDate,
        uint initialExchangeDate,
        uint maturityDate,
        uint purchaseDate,
        uint capitalizationEndDate,
        uint cycleAnchorDateOfInterestPayment,
        uint cycleAnchorDateOfRateReset,
        uint cycleAnchorDateOfScalingIndex,
        uint cycleAnchorDateOfFee,
        int notionalPrincipal,
        int nominalInterestRate,
        int accruedInterest,
        int rateMultiplier
    )
        external
    {
        require(currency != address(0x00), "Invalid currency address");
        require(settlementCurrency != address(0x00), "Invalid settlement currency address");
        require(marketObjectCodeRateReset != bytes32(0x00), "Code rate request is required");
        require(contractDealDate != 0, "Contract deal date can't be empty");
        require(statusDate != 0, "statusDate can't be empty");
        require(initialExchangeDate != 0, "initialExchangeDate can't be empty");
        require(maturityDate != 0, "maturityDate can't be empty");
        require(purchaseDate != 0, "purchaseDate can't be empty");
        require(capitalizationEndDate != 0, "capitalizationEndDate can't be empty");
        require(cycleAnchorDateOfInterestPayment != 0, "cycleAnchorDateOfInterestPayment can't be empty");
        require(cycleAnchorDateOfScalingIndex != 0, "cycleAnchorDateOfScalingIndex can't be empty");
        require(cycleAnchorDateOfFee != 0, "cycleAnchorDateOfFee can't be empty");
        require(notionalPrincipal != 0, "notionalPrincipalnotionalPrincipal can't be empty");
        require(nominalInterestRate != 0, "nominalInterestRate can't be empty");
        require(accruedInterest != 0, "accruedInterest can't be empty");
        require(rateMultiplier != 0, "rateMultiplier can't be empty");
        
        saveDetailsToStorage(
            currency,
            settlementCurrency,
            marketObjectCodeRateReset,
            notionalPrincipal,
            nominalInterestRate,
            accruedInterest,
            rateMultiplier
        );
        
        saveDatesToStorage(
            contractDealDate,
            statusDate,
            initialExchangeDate,
            maturityDate,
            purchaseDate,
            capitalizationEndDate,
            cycleAnchorDateOfInterestPayment,
            cycleAnchorDateOfRateReset,
            cycleAnchorDateOfScalingIndex,
            cycleAnchorDateOfFee
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