// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint8 public number1;
    uint256 public number2;
    uint256 public constant number3 = 1;
    bool public isTrue;
    mapping (address => uint256) public balances;
    uint256[] public array;

    event Log(string func, uint256 gas);

    function setNumber(uint8 newNumber) public {
        number1 = newNumber;
        array.push(newNumber);
    }

    function increment() public {
        number1++;
    }

    // Explainer from: https://solidity-by-example.org/fallback/
    //                  send Ether
    //                       |
    //            msg.data is empty?
    //                 /           \
    //             yes             no
    //              |                |
    //     receive() exists?     fallback()
    //         /        \
    //      yes          no
    //       |            |
    //   receive()     fallback()

    // Fallback function must be declared as external.
    fallback() external payable {
        // send / transfer (forwards 2300 gas to this fallback function)
        // call (forwards all of the gas)
        emit Log("fallback", gasleft());
    }

    // Receive is a variant of fallback that is triggered when msg.data is empty
    receive() external payable {
        emit Log("receive", gasleft());
    }
}
