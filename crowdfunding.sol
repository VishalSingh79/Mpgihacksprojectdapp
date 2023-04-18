// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./ICROWDFUND.sol";
import "./IERC20.sol";



contract CROWDFUNDING is ICROWDFUND{

enum STATE {ONGOING, DONE }

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
       owner = msg.sender;
       mincontribution = _mincontribution;
       target =  _target ;

 }

  modifier targetrecahed(){
      require()
  }

  modifier onlyOwner(){
      require(msg.sender==owner);
      _;
  }

 function getBalanceETH() public view returns(uint){
     return address(this).balance; 
 }

 function getBalanceUSDT() public view returns(uint){
     return USDT.balanceof(address(this));
 }




// funcitonality should only  be avaiable if user wnats to add stablecoin  as donaation 
 //function addStableCoin() public onlyOwner {
  //   stableadd1 = _allowedstablecoin["USDC"] = 0x7EA2be2df7BA6E54B1A9C70676f668455E329d29;
  //   stableadd2 =  _allowedstablecoin["USDT"] = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
   //  stableadd1 = IERC20(_allowedstablecoin["USDC"]);
   //  stableadd2 =  IERC20(_allowedstablecoin["USDT"]);
   // }


function refund() public payable{
    require(_balances[msg.sender] > 0, "more refund than possible");
     
    


}
  
function sendETH() public payable{
    require(msg.value > mincontribution);
    
    if(_balances[msg.sender] == 0 ){
        contributors++;
    }
     valueraised = valueraised +  msg.value;
     _balances[msg.sender] = msg.value ;
}

function sendERC20(_amount) public ;
    
    
  
} 





}
