// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "./StrategyIdLib.sol";
import "../../core/libs/CommonLib.sol";

/// @dev Strategy developer addresses used when strategy implementation was deployed at a network.
///      StrategyLogic NFT is minted to the address of a strategy developer.
library StrategyDeveloperLib {
    function getDeveloper(string memory strategyId) internal pure returns (address) {
        if (CommonLib.eq(strategyId, StrategyIdLib.GAMMA_QUICKSWAP_MERKL_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.QUICKSWAP_STATIC_MERKL_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.COMPOUND_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.DEFIEDGE_QUICKSWAP_MERKL_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.ICHI_QUICKSWAP_MERKL_FARM)) {
            return 0x4f86e6d7FE4D7cd2C1E08f4108C8E5f0Ca2553a3;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.ICHI_RETRO_MERKL_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.GAMMA_RETRO_MERKL_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.GAMMA_UNISWAPV3_MERKL_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.CURVE_CONVEX_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.YEARN)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.STEER_QUICKSWAP_MERKL_FARM)) {
            return 0xDa1A2a4A3fE9702b4FB0ddA13F702fc2395E2534;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.TRIDENT_PEARL_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.BEETS_STABLE_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.BEETS_WEIGHTED_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.EQUALIZER_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.ICHI_SWAPX_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.SWAPX_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.SILO_FARM)) {
            return 0xa12C4Bbe4D6eD65285f05328Bca4462Bf4808E53;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.ALM_SHADOW_FARM)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.SILO_LEVERAGE)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.SILO_ADVANCED_LEVERAGE)) {
            return 0x88888887C3ebD4a33E34a15Db4254C74C75E5D4A;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.GAMMA_EQUALIZER_FARM)) {
            return 0x9485879Ea033f6b2Cc1A5Cfd1C2c2bB2e7303C68;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.ICHI_EQUALIZER_FARM)) {
            return 0x9485879Ea033f6b2Cc1A5Cfd1C2c2bB2e7303C68;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.SILO)) {
            return 0xa12C4Bbe4D6eD65285f05328Bca4462Bf4808E53;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.EULER)) {
            return 0xcd18A818f2eC5C21EEF6771183eD5641B15da247;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.AAVE)) {
            return 0x9485879Ea033f6b2Cc1A5Cfd1C2c2bB2e7303C68;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.SILO_MANAGED_FARM)) {
            return 0xcd18A818f2eC5C21EEF6771183eD5641B15da247;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.SILO_ALMF_FARM)) {
            return 0xcd18A818f2eC5C21EEF6771183eD5641B15da247;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.AAVE_MERKL_FARM)) {
            return 0xcd18A818f2eC5C21EEF6771183eD5641B15da247;
        }
        if (CommonLib.eq(strategyId, StrategyIdLib.COMPOUND_V2)) {
            return 0xcd18A818f2eC5C21EEF6771183eD5641B15da247;
        }
        return address(0);
    }
}
