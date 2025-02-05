//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";



contract MyToken is ERC20 {
    constructor() ERC20("MyToken", "MT"){

    }
}