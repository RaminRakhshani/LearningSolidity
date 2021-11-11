pragma solidity 0.8.10; //>=0.4.22 <0.9.0;

contract MyContract {
    function randModulus(uint256 mod) external view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.timestamp,
                        block.difficulty,
                        msg.sender
                    )
                )
            ) % mod;
    }
}

contract Oracle {
    address admin;
    uint256 public rand;

    constructor() public {
        admin = msg.sender;
    }

    function feedRamdomNumer(uint256 _rand) external {
        require(msg.sender == admin);
        rand = _rand;
    }
}

contract MyContract2 {
    Oracle oracle;
    uint256 nonce;

    constructor(address oracleAddress) public {
        oracle = Oracle(oracleAddress);
    }

    function foo() external view {
        uint256 rand = _randModulus(10);
        //use rand
    }

    function _randModulus(uint256 mod) internal view returns (uint256) {
        uint256 rand = uint256(
            keccak256(
                abi.encodePacked(
                    nonce,
                    oracle.rand(),
                    block.timestamp,
                    block.difficulty,
                    msg.sender
                )
            )
        ) % mod;

        return rand;
    }
}
