// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./crowdfunding.sol";



contract CROWDFUNDINGFACTORY{

    address[] public deployaddress ;
     
     receive() external payable{}

     fallback() external payable{}
   

    function deploy(uint _mincontribution , uint _target , uint _deadline)  internal {
          CROWDFUNDING newcrowdfundingcontract = new CROWDFUNDING(_mincontribution,_target , _deadline);
          deployaddress.push(newcrowdfundingcontract);
    }

    

}
