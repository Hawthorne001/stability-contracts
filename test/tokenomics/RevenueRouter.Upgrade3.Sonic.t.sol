// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {console, Test} from "forge-std/Test.sol";
import {SonicConstantsLib} from "../../chains/sonic/SonicConstantsLib.sol";
import {IPlatform} from "../../src/interfaces/IPlatform.sol";
import {RevenueRouter, IRevenueRouter, IControllable} from "../../src/tokenomics/RevenueRouter.sol";
import {IVault} from "../../src/interfaces/IVault.sol";

contract RevenueRouterUpgrade3TestSonic is Test {
    uint public constant FORK_BLOCK = 38301556; // Jul-13-2025 09:27:35 AM +UTC
    address public constant PLATFORM = SonicConstantsLib.PLATFORM;
    address public multisig;
    IRevenueRouter public revenueRouter;

    constructor() {
        vm.selectFork(vm.createFork(vm.envString("SONIC_RPC_URL"), FORK_BLOCK));
        multisig = IPlatform(PLATFORM).multisig();
        revenueRouter = IRevenueRouter(IPlatform(PLATFORM).revenueRouter());
        _upgradeRevenueRouter();
    }

    function testUpgrade150() public {
        revenueRouter.processAccumulatedVaults(50);
    }

    function _upgradeRevenueRouter() internal {
        address[] memory proxies = new address[](1);
        proxies[0] = address(revenueRouter);
        address[] memory implementations = new address[](1);
        implementations[0] = address(new RevenueRouter());
        vm.startPrank(multisig);
        IPlatform(PLATFORM).announcePlatformUpgrade("2025.07.3-alpha", proxies, implementations);
        skip(18 hours);
        IPlatform(PLATFORM).upgrade();
        vm.stopPrank();
        rewind(17 hours);
    }
}
