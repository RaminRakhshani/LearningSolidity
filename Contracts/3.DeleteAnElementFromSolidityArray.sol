pragma solidity >=0.4.22 <0.9.0;

contract MyContract {
    string[] public data;

    constructor() public {
        data.push("Ramin");
        data.push("Rakhshani");
        data.push("is");
        data.push("Learning");
        data.push("Solidity");
    }

    function remioveNoOrder(uint256 index) external {
        data[index] = data[data.length - 1];
        data.pop();
    }

    function remioveInOrder(uint256 index) external {
        for (uint256 i = index; i < data.length - 1; i++) {
            data[i] = data[i + 1];
        }
        data.pop();
    }
}
