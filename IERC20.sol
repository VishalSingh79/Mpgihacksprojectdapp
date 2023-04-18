// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


  interface IERC20{
    function transfer(address to , uint amount) external returns(bool);

    function balanceof(address account) external  view returns(uint); 

}
