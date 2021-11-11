pragma solidity 0.8.10; //>=0.4.22 <0.9.0;

//?
pragma experimental ABIEncoderV2;

contract Coollection {
    struct User {
        uint256 id;
        string name;
    }
    string[] public data;
    mapping(uint256 => User) users;

    uint256 nextUsetrId;
}

contract Coollection2 {
    struct User {
        address userAddress;
        uint256 balance;
    }
    User[] users;

    function getUsers1()
        external
        view
        returns (address[] memory, uint256[] memory)
    {
        address[] memory userAddresses = new address[](users.length);
        uint256[] memory balances = new uint256[](users.length);

        for (uint256 I = 0; I < users.length; I++) {
            userAddresses[I] = users[I].userAddress;
            balances[I] = users[I].balance;
        }

        return (userAddresses, balances);
    }

    function getUsers2() external view returns (User[] memory) {
        return users;
    }
}
