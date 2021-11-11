pragma solidity >=0.4.22 <0.9.0;

contract Utils {
    function groupExecute(uint argA, uint argB) {
        ContractA(0x ...).first(argA);
        ContractB(0x ...).second(argA)
    }
}
contract ContractA {
    function first(uint arg0) {
        //do somthing
    }
}

contract ContractB {
    function second(uint arg) {
        // do somthing
    }
}