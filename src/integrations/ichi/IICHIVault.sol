// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

interface IICHIVault{

    function ichiVaultFactory() external view returns(address);

    function pool() external view returns(address);
    function token0() external view returns(address);
    function allowToken0() external view returns(bool);
    function token1() external view returns(address);
    function allowToken1() external view returns(bool);
    function fee() external view returns(uint24);
    function tickSpacing() external view returns(int24);
    function affiliate() external view returns(address);

    function baseLower() external view returns(int24);
    function baseUpper() external view returns(int24);
    function limitLower() external view returns(int24);
    function limitUpper() external view returns(int24);

    function deposit0Max() external view returns(uint256);
    function deposit1Max() external view returns(uint256);
    function maxTotalSupply() external view returns(uint256);
    function totalSupply() external view returns(uint256);
    function hysteresis() external view returns(uint256);
    function currentTick(address) external view returns(uint256);

    function getTotalAmounts() external view returns (uint256, uint256);

    function deposit(
        uint256,
        uint256,
        address
    ) external returns (uint256);

    function withdraw(
        uint256,
        address
    ) external returns (uint256, uint256);

    function rebalance(
        int24 _baseLower,
        int24 _baseUpper,
        int24 _limitLower,
        int24 _limitUpper,
        int256 swapQuantity
    ) external;

    function collectFees() external returns(uint256 fees0, uint256 fees1);
}