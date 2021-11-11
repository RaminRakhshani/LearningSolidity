pragma solidity ^0.8.10;

interface ExchangeB {
    function getPriceForToken(address token) external view returns (uint256);

    function executeTrade(address token, uint256 amount)
        external
        returns (uint256);
}
