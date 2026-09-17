// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract AddressDemo{
    address public owner;//表示存储当前合约的部署账号
    //构造函数中赋值
    constructor(){
        //msg.sender也是solidity的全局变量
        //表示能获得当前调用合约的账号地址
        owner = msg.sender;
    }
    //获得账号的余额，余额是wei来做单位
    function getBalance(address _addr) view public returns(uint){
        return _addr.balance;
    }
    //转账：从外部账号转入到当前合约地址账号
    //payable表示当前函数可以转账
    function diposit() public payable{}
    //转账：从合约账号地址转出到外部账号_to，金额是amount wei
    function transferETH(address _to,uint amount) public payable{
        //使用solidity错误处理函数，判断当前合约地址余额是否足够转账
        //address(this)表示当前合约地址
        require(address(this).balance>=amount,unicode"合约余额不够");
        //payable修饰的地址才能接受转账
        payable(_to).transfer(amount);
    }
}
