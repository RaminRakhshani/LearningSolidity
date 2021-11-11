pragma solidity 0.8.10; //>=0.4.22 <0.9.0;

contract MyContract {
    function length(string calldata str) external pure returns (uint256) {
        return bytes(str).length;
    }

    function concatenate(string calldata a, string calldata b)
        external
        pure
        returns (string memory)
    {
        return string(abi.encodePacked(a, b));
    }

    function rverse(string calldata _str)
        external
        pure
        returns (string memory)
    {
        bytes memory str = bytes(_str);
        string memory tmp = new string(str.length);
        bytes memory _reverse = bytes(tmp);

        for (uint256 index = 0; index < str.length; index++) {
            _reverse[str.length - index - 1] = str[index];
        }

        return string(_reverse);
    }

    function compare(string calldata a, string calldata b)
        external
        pure
        returns (bool)
    {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }
}
