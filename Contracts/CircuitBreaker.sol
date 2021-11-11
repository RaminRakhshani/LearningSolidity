pragma solidity ^0.8.10;

contract CircuitBreaker {
    bool isActive = true;
    address admin;

    modifier contractIsActive() {
        require(isActive == true);
        _;
    }

    constructor() public {
        admin = msg.sender;
    }

    function toggleCircuitBreaker() external contractIsActive {
        require(admin == msg.sender);
        isActive = !isActive;
    }

    function withdraw() external contractIsActive {}

    receive() external payable {}
}
