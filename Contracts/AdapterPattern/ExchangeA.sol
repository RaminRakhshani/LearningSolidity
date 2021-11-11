pragma solidity ^0.8.10;

interface ExchangeA {
    function priceForToken(address token) external view returns (uint256);

    function enterToken(address token, uint256 amount)
        external
        returns (uint256);
}
