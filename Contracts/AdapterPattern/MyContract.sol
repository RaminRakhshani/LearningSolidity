pragma solidity ^0.8.10;

import "./Adapter.sol";
import "./Token.sol";

contract MyContract {
    Adapter adapter;
    Token token;

    constructor(address tokenAddress) public {
        token = Token(tokenAddress);
    }

    function updateAdapter(address adapterAddress) external {
        adapter = Adapter(adapterAddress);
    }

    function invest(uint256 amount) external {
        token.approve(address(adapter), amount);
        address bestExchange = adapter.getBestExchangeFor(address(token));
        adapter.invest(amount, address(token), bestExchange);
    }
}
