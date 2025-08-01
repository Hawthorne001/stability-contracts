// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Script} from "forge-std/Script.sol";
import {PriceReader} from "../../src/core/PriceReader.sol";

contract DeployPriceReader is Script {
    function run() external {
        uint deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        new PriceReader();
        vm.stopBroadcast();
    }

    function testDeployScript() external {}
}
