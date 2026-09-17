// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

//【本节：payable 与 ETH 转账】
//payable 修饰的函数才能接收 ETH；payable 修饰的地址才能转账
contract TransferDemo {
    address public owner; //记录部署者，用于权限控制

    constructor() {
        owner = msg.sender; //msg.sender：当前调用者，部署时即部署账号
    }

    //【查询当前合约账号余额，单位 wei】address(this) 表示当前合约地址
    //【查余额】balance 是 address 的成员，返回该地址的余额(wei)
    function getBalance() public view returns (uint) { return address(this).balance; }
    // 17行：payable表示当前函数可以转账
    function deposit() public payable {}
    // 19行：转账：从合约账号地址转出到外部账号_to，金额是amount wei
    function transferETH(address _to,uint amount) public payable{
        // 21行：使用solidity错误处理函数，判断当前合约地址余额是否足够转账
        // 22行：address(this)表示当前合约地址
        require(address(this).balance>=amount, unicode"合约余额不够");
        payable(_to).transfer(amount);
    }
}
