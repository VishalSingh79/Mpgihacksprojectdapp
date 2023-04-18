// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


interface ICROWDFUND{



    function  sendETH() external payable ;

    function  getBalanceETH() external view returns(uint);

    //function getBalanceUSDC() external view returns(uint);

    function getBalanceUSDT() external view returns(uint);

    function sendERC20() external payable ;

    function refund() external payable ;


}
