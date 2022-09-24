//SPDX-License-Identifier: Unlicense
pragma solidity >=0.4.22 <0.9.0;
contract HoneyPot {
  mapping (address => uint) public balances;
  constructor ()  payable {
    put();
  }
  function put() public  payable {    balances[msg.sender] = msg.value;
  }
  function get() public {
    // if (!msg.sender.call.value(balances[msg.sender])()) {
    //   // revert();
    // }
    payable(msg.sender).transfer(balances[msg.sender]);
      balances[msg.sender] = 0;
  }
  fallback() external  {
    revert();
  }
  function Balance() public view  returns(uint256){
    return address(this).balance;
}


}