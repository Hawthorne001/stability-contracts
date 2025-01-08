// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {console} from "forge-std/Test.sol";
import {SonicSetup} from "../base/chains/SonicSetup.sol";
import "../../chains/SonicLib.sol";
import "../base/UniversalTest.sol";
import {IGaugeV2_CL} from "../../src/integrations/swapx/IGaugeV2_CL.sol";
import {IVoterV3} from "../../src/integrations/swapx/IVoterV3.sol";
import {IICHIVaultV4} from "../../src/integrations/ichi/IICHIVaultV4.sol";

contract IchiSwapXFarmStrategyTest is SonicSetup, UniversalTest {
    constructor() {
        // vm.rollFork(2927006); // Jan-08-2025 12:44:45 AM +UTC)
        vm.rollFork(2971000); // Jan-08-2025 10:33:57 AM +UTC
        skip(86400 * 2);

        depositedSharesCheckDelimiter = 10;
        makePoolVolumePriceImpactTolerance = 90_000;
        allowZeroApr = true;

        // prevent emergencystop revert for empty Ichi ALMs
        _deal(SonicLib.TOKEN_wS, address(1), 20e18);
        _deal(SonicLib.TOKEN_SACRA_GEM_1, address(1), 1000e18);
        vm.startPrank(address(1));
        IERC20(SonicLib.TOKEN_wS).approve(SonicLib.ALM_ICHI_SWAPX_wS_SACRA_GEM_1, type(uint).max);
        IERC20(SonicLib.TOKEN_SACRA_GEM_1).approve(SonicLib.ALM_ICHI_SWAPX_SACRA_GEM_1_wS, type(uint).max);
        IICHIVaultV4(SonicLib.ALM_ICHI_SWAPX_wS_SACRA_GEM_1).deposit(20e18, 0, address(1));
        IICHIVaultV4(SonicLib.ALM_ICHI_SWAPX_SACRA_GEM_1_wS).deposit(0, 1000e18, address(1));
        vm.stopPrank();
    }

    function testISF() public universalTest {
        _addStrategy(8);
        _addStrategy(9);
        _addStrategy(10);
        _addStrategy(11);
        _addStrategy(12);
        _addStrategy(13);
    }

    function _preHardWork() internal override {
        IGaugeV2_CL gauge = IGaugeV2_CL(IFarmingStrategy(currentStrategy).stakingPool());
        IVoterV3 voter = IVoterV3(gauge.DISTRIBUTION());
        address minter = voter.minter();
        address[] memory gauges = new address[](1);
        gauges[0] = address(gauge);
        // uint rewardAmount = 1e18;
        // _deal(SonicLib.TOKEN_SWPx, minter, rewardAmount);
        vm.startPrank(minter);
        // IERC20(SonicLib.TOKEN_SWPx).approve(address(voter), type(uint).max);
        // voter.notifyRewardAmount(rewardAmount);
        voter.distribute(gauges);
        vm.stopPrank();
    }

    function _addStrategy(uint farmId) internal {
        strategies.push(
            Strategy({id: StrategyIdLib.ICHI_SWAPX_FARM, pool: address(0), farmId: farmId, underlying: address(0)})
        );
    }
}
