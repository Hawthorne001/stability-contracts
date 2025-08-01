// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {console, Test} from "forge-std/Test.sol";
import {SonicConstantsLib} from "../../chains/sonic/SonicConstantsLib.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IPlatform} from "../../src/interfaces/IPlatform.sol";
import {RevenueRouter, IRevenueRouter, IControllable} from "../../src/tokenomics/RevenueRouter.sol";
import {IVault} from "../../src/interfaces/IVault.sol";

contract RevenueRouterUpgradeTestSonic is Test {
    uint public constant FORK_BLOCK = 37470000; // Jul-07-2025 11:01:49 AM +UTC
    address public constant PLATFORM = SonicConstantsLib.PLATFORM;
    address public multisig;
    IRevenueRouter public revenueRouter;

    constructor() {
        vm.selectFork(vm.createFork(vm.envString("SONIC_RPC_URL"), FORK_BLOCK));
        multisig = IPlatform(PLATFORM).multisig();
        revenueRouter = IRevenueRouter(IPlatform(PLATFORM).revenueRouter());
        _upgradeRevenueRouter();
    }

    function testUpgrade120() public {
        vm.expectRevert(IControllable.NotGovernanceAndNotMultisig.selector);
        revenueRouter.addUnit(IRevenueRouter.UnitType.AaveMarkets, "Lending", SonicConstantsLib.LENDING_FEE_TREASURY);
        vm.prank(multisig);
        revenueRouter.addUnit(IRevenueRouter.UnitType.AaveMarkets, "Lending", SonicConstantsLib.LENDING_FEE_TREASURY);
        vm.prank(multisig);
        revenueRouter.updateUnit(
            0, IRevenueRouter.UnitType.AaveMarkets, "Lending1", SonicConstantsLib.LENDING_FEE_TREASURY
        );

        revenueRouter.processUnitRevenue(0);

        address[] memory aavePools = new address[](3);
        aavePools[0] = SonicConstantsLib.STABILITY_MARKET_Stream;
        aavePools[1] = SonicConstantsLib.STABILITY_MARKET_StableJack;
        aavePools[2] = SonicConstantsLib.STABILITY_MARKET_Brunch;
        vm.expectRevert(IControllable.NotGovernanceAndNotMultisig.selector);
        revenueRouter.setAavePools(aavePools);
        vm.prank(multisig);
        revenueRouter.setAavePools(aavePools);

        revenueRouter.processUnitsRevenue();
    }

    function testHardWorks() public {
        vm.startPrank(IPlatform(PLATFORM).hardWorker());
        IVault(SonicConstantsLib.VAULT_C_USDC_SiMF_Valmore).doHardWork();
        IVault(SonicConstantsLib.VAULT_C_USDC_Stability_Stream).doHardWork();
        IVault(SonicConstantsLib.VAULT_LEV_SiL_stS_S).doHardWork();
        IVault(SonicConstantsLib.VAULT_LEV_SiL_S_stS).doHardWork();
        IVault(SonicConstantsLib.VAULT_LEV_SiAL_wstkscUSD_USDC).doHardWork();
        vm.stopPrank();
        vm.roll(block.number + 6);
        revenueRouter.processUnitsRevenue();
    }

    function _upgradeRevenueRouter() internal {
        address[] memory proxies = new address[](1);
        proxies[0] = address(revenueRouter);
        address[] memory implementations = new address[](1);
        implementations[0] = address(new RevenueRouter());
        vm.startPrank(multisig);
        IPlatform(PLATFORM).announcePlatformUpgrade("2025.07.0-alpha", proxies, implementations);
        skip(18 hours);
        IPlatform(PLATFORM).upgrade();
        vm.stopPrank();
        rewind(17 hours);
    }
}
