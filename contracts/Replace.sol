// Copyright SECURRENCY INC.
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;
import "hardhat/console.sol";

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

    function test1() external {
        string memory result = replace("one two one two on e ononee", "one", "three");
        string memory expected = "three two three two on e onthreee";
        require(
            keccak256(bytes(result)) == keccak256(bytes(expected)),
            "Wrong result test 1"
        );
    }

    function test2() external {
        string memory result = replace("1 2 3", " ", ",");
        string memory expected = "1,2,3";
        require(
            keccak256(bytes(result)) == keccak256(bytes(expected)),
            "Wrong result test 2"
        );
    }

    function replace(string memory input, string memory stringToSearch, string memory stringToReplace) public pure returns (string memory) {
        // Write your code here

        bytes memory bytesToSearch = bytes(stringToSearch);
        bytes memory bytesToReplace = bytes(stringToReplace);
        bytes memory resultBytes = bytes(input);
        int startPos = 0;
        uint stringToSearchLength = bytesToSearch.length;

        while (true) {
            startPos = findInString(resultBytes, bytesToSearch, uint(startPos));
            if (startPos == -1) return string(resultBytes);

            uint start =  uint(startPos);

            bytes memory beforeBytes;
            bytes memory afterBytes;
        
            if (start <= 1) {
                beforeBytes = bytes("");
            } else {
                beforeBytes = getSlice(resultBytes, 1, start-1);
            }
            uint end = beforeBytes.length + stringToSearchLength;
        
            if (end >= resultBytes.length) {
                afterBytes = bytes("");
            } else {
                afterBytes = getSlice(resultBytes, end + 1, resultBytes.length - end);
            }

            resultBytes = concatString(beforeBytes, bytesToReplace, afterBytes);

            startPos += int(stringToSearchLength);
        }

        return string(resultBytes);
    }

    function getSlice(bytes memory source, uint startPos, uint numChars) public pure returns (bytes memory) {
        uint ustartPos = startPos - 1;

        if (numChars == 0) {
            numChars = source.length - ustartPos + 1;
        }
        
        bytes memory result = new bytes(numChars);     

        for (uint i = 0; i< numChars; i++) {
            result[i] = source[i + ustartPos];
        }
        return result;
    }

    function findInString(bytes memory source, bytes memory findString, uint startAfter ) public pure returns(int) {
        uint targetLength = findString.length;
        uint sourceLength = source.length;
         
        require(targetLength > 0 || sourceLength > 0, "missing param source or findingString");
        require (startAfter <= (sourceLength - targetLength) + 1, "startAfter is larger than source - findstring"); 

         uint sourceIndex = startAfter + 1;
         uint targetIndex = 1;
         bytes memory firstChar = charAt(findString, 1);
         
         while(sourceIndex <= (sourceLength - targetLength)) {
             int index = findChar(source, firstChar, sourceIndex -1);
             if (index == -1) {return -1;}  //first character of search term not found in source
             if (targetLength == 1) {return index;}  //Search for a single character.
             sourceIndex = uint(index);
             //we found the first character.  Look for the rest of the string;
             uint nextSourceIndex = sourceIndex + 1;
             targetIndex = 2;
             while(targetIndex <= targetLength) {
                 
                 bytes memory charToFind = charAt(findString, targetIndex);
                 bytes memory nextSourceChar = charAt(source, nextSourceIndex);
          
                 if (!(charCompare(charToFind, nextSourceChar))) {
                     break;
                 }
                 if(targetIndex == targetLength) {
                     return int(sourceIndex);
                 } else {
                    nextSourceIndex += 1;
                    targetIndex++;
                 }
             }
             sourceIndex +=1;   
         }
         return -1;
    }

    function charAt(bytes memory str, uint startIndex) public pure returns (bytes memory) {
        bytes memory result = new bytes(1);
        result[0] = str[startIndex - 1];
        return result;
    }

    function findChar(bytes memory source, bytes memory charToFind, uint startAfter) public pure returns(int) {
        uint sourceLength = source.length;

         uint sourceIndex = startAfter + 1;
         
         while(sourceIndex <= (sourceLength - 1)) {
            bytes memory charToCompare = charAt(source, sourceIndex);
            if (charCompare(charToCompare, charToFind) == true) {
                return int(sourceIndex);
            } else {
                sourceIndex += 1;
            }
         }
         return -1;
    }

    function concatString(bytes memory a, bytes memory b, bytes memory c) internal pure returns (bytes memory) {
        return bytes.concat(a, b, c);
    }

    function charCompare(bytes memory a, bytes memory b) public pure returns (bool) {
        return a[0] == b[0];
    }
}
