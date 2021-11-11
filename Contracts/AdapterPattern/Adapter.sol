pragma solidity ^0.8.10;

import "./ExchangeA.sol";
import "./ExchangeB.sol";

contract Adapter {
    ExchangeA exchangeA;
    ExchangeB exchangeB;

    constructor(address exchangeAAddress, address exchangeBAddress) public {
        exchangeA = ExchangeA(exchangeAAddress);
        exchangeB = ExchangeB(exchangeBAddress);
    }

    function getBestExchangeFor(address token) external view returns (address) {
        uint256 priceA = exchangeA.priceForToken(token);
        uint256 priceB = exchangeB.getPriceForToken(token);

        return priceA > priceB ? address(exchangeB) : address(exchangeA);
    }

    function invest(
        uint256 amount,
        address token,
        address exchange
    ) external {
        if (exchange == address(exchangeA)) {
            exchangeA.enterToken(token, amount);
        } else {
            exchangeB.executeTrade(token, amount);
        }
    }
}
