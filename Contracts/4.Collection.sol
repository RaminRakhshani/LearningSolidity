pragma solidity 0.8.10; //>=0.4.22 <0.9.0;

contract Coollection {
    struct User {
        uint256 id;
        string name;
    }
    string[] public data;
    mapping(uint256 => User) users;

    uint256 nextUsetrId;
}
