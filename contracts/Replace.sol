// Copyright SECURRENCY INC.
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
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

    function replace(string memory input, string memory stringToSearch, string memory stringToReplace) public pure returns (string memory) {
        // Write your code here

        string memory retval = input;
        int startPos = 0;
        uint stringToSearchLength = stringLength(stringToSearch);

        while (true) {
            startPos = findInString(retval, stringToSearch, uint(startPos));
            if (startPos == -1) return retval;

            uint start =  uint(startPos);
            string memory beforeString;
            string memory afterString;
        
            if (start <= 1) {
                beforeString = "";
            } else {
                beforeString = getSlice(retval, 1, start-1);
            }
            uint end = uint(stringLength(beforeString) + stringToSearchLength);
        
            if (end>= uint(stringLength(retval))) {
                afterString = "";
            } else {
                afterString = getSlice(retval, end +1, uint(stringLength(retval))-end);
            }

            retval = concatString(beforeString, stringToReplace);

            if(stringLength(afterString)>0) {
                retval = concatString(retval, afterString);
            }

            startPos += int(stringToSearchLength);
        }


        return retval;
    }

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


    ///
    /// https://ethereum.stackexchange.com/questions/106801/how-to-code-a-string-replace-function-in-solidity
    ///
    function getSlice(string memory source, uint startPos, uint numChars) public pure returns (string memory) {
       uint ustartPos = uint(startPos -1);
       uint _numChars = uint(numChars);

        bytes memory sourcebytes = bytes(source);
       if (_numChars==0) {
           _numChars = ((sourcebytes.length - ustartPos) + 1);
       }
      
      bytes memory result = new bytes(_numChars);     

      for (uint i = 0; i<_numChars; i++) {
          result[i] = sourcebytes[i + ustartPos];
      }
      return string(result); 
    }

    function findInString(string memory source, string memory findString, uint startAfter ) public pure returns(int) {
        uint targetLength = stringLength(findString);
        uint sourceLength = stringLength(source);
         
        require(targetLength > 0 || sourceLength > 0, "missing param source or findingString");
        require (startAfter <= (sourceLength - targetLength) + 1, "startAfter is larger than source - findstring"); 

         uint sourceIndex = startAfter + 1;
         uint targetIndex = 1;
         string memory firstChar = charAt(findString, 1);
         
         while(sourceIndex <= (sourceLength - targetLength)) {
             int index = findChar(source, firstChar, sourceIndex -1);
             if (index == -1) {return -1;}  //first character of search term not found in source
             if (targetLength == 1) {return index;}  //Search for a single character.
             sourceIndex = uint(index);
             //we found the first character.  Look for the rest of the string;
             uint nextSourceIndex = sourceIndex + 1;
             targetIndex = 2;
             while(targetIndex <= targetLength) {
                 
                 string memory charToFind=charAt(findString, targetIndex);
                 string memory nextSourceChar = charAt(source, nextSourceIndex);
          
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

    function charAt(string memory str, uint startIndex) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(1);
        result[0] = strBytes[startIndex - 1];
        return string(result);
    }

    function findChar(string memory source, string memory charToFind, uint startAfter) public pure returns(int) {
        uint sourceLength = stringLength(source);

         uint sourceIndex = startAfter + 1;
         
         while(sourceIndex <= (sourceLength - 1)) {
            string memory charToCompare=charAt(source, sourceIndex);
            if (charCompare(charToCompare, charToFind) == true) {
                return int(sourceIndex);
            } else {
                sourceIndex += 1;
            }
         }
         return -1;
    }

    function stringLength(string memory s) public pure returns (uint256) {
        return bytes(s).length;
    }

    function concatString(string memory a, string memory b) internal pure returns (string memory) {
        return string(abi.encodePacked(a, b));
    }

    function charCompare(string memory a, string memory b) public pure returns (bool) {
        return bytes(a)[0] == bytes(b)[0];
    }
}
