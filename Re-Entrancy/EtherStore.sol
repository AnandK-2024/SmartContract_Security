//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// contract Address-0x220ABbc4E05d8eBb1915e9F6EcC6b22117c9cd83 on ropsten testnet
//------------------------------------------------------------------------------
//--------------------------------------------------------------------------

contract EtherStore {

    uint256 public withdrawalLimit = 1 ether;
    mapping(address => uint256) public lastWithdrawTime;
    mapping(address => uint256) public balances;

    function depositFunds() public payable {
                balances[msg.sender] += msg.value;
    }

    function withdrawFunds (uint256 _weiToWithdraw) public payable  {
        require(balances[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(_weiToWithdraw <= withdrawalLimit);
        // limit the time allowed to withdraw
        require(block.timestamp >= lastWithdrawTime[msg.sender] + 1 weeks);

        // require(msg.sender.call.value(_weiToWithdraw)());
        (bool sent, ) = payable(msg.sender).call{value: msg.value}("");
        require(sent, "Failed to send Ether to previous Owner of  Nft");
        balances[msg.sender] -= _weiToWithdraw;
        lastWithdrawTime[msg.sender] = block.timestamp;
    }
    function Balance() public view  returns(uint ){
        return (address(this).balance);
    }

    function data() public pure returns( bytes calldata){
        return msg.data;
    }
 }