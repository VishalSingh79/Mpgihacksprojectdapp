// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./ICROWDFUND.sol";
import "./IERC20.sol";



contract CROWDFUNDING is ICROWDFUND{


 receive() external payable{}
    


 fallback() external payable {}


 event FundingReceived(address contributor, uint amount, uint currentTotal);

// for consensus 
 struct Request {
        string description;
        uint value;
        address payable recipient;
        bool complete;
        uint approvalCount;
        mapping(address => bool) approvals;
    }



 address public owner;
 uint public  contributors;
 uint public mincontribution;
 uint public target;
 uint public deadline;
 IERC20 USDT = IERC20(0xdAC17F958D2ee523a2206206994597C13D831ec7);

 uint public valueraised;
 
 mapping (address => uint) _balances;

 mapping (string => address) internal  _allowedstablecoin;
  
 constructor( uint _mincontribution , uint _target ) {
       owner = payable(msg.sender);
       mincontribution = _mincontribution;
       target =  _target ;

 }



  modifier onlyOwner(){
      require(msg.sender==owner);
      _;
  }
  
  modifier reached(){
      require(valueraised < target);
      _;
  }

 function getBalanceETH() public view returns(uint){
     return address(this).balance; 
 }

// function getBalanceUSDT() public view returns(uint){
  //   return USDT.balanceof(address(this));
// }






// user will get only 90% of the donation back as it is required for transaction to pay for gas fee
function refund(address refundee) public payable{
    require(_balances[msg.sender] > 0, "more refund than possible");
    (bool success, ) = payable(refundee).call{value: _balances[msg.sender]}("");
    if(!success){
    	revert();
    }
    valueraised -= _balances[msg.sender];
    _balances[msg.sender] = 0;
    contributors--;

}
  
function sendETH() public payable reached {
    require(msg.value > mincontribution);
    
    if(_balances[msg.sender] == 0 ){
        contributors++;
    }
     valueraised = valueraised +  msg.value;
     _balances[msg.sender] = msg.value ;

     emit FundingReceived(msg.sender, msg.value , valueraised);
}

function transferFundsToOwner() public onlyOwner {
   (bool success, ) = owner.call{value: _balances[msg.sender]}("");
    if(!success){
    	revert();
    }     
}

function get90percent(uint _amount) internal pure returns(uint){}

}
