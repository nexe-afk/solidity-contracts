// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ConstantDemo{
    //1、声明一个constant常量，编译器常量
    //放在所有函数的外面来声明，必须要赋值
    uint constant public MAX_SCORE = 100;
    //2、声明一个commutable常量，部署期常量
    //放在所有函数的外面来声明，可以先不赋值
    //如果在声明的时候不赋值则一定要在构造函数里面赋值
    uint immutable public SCHOOL_NUMBER = 10000;
    uint immutable public DEPLOY_TIME;//部署合约的时间
    //在构造函数中给immutable常量赋值
    constructor(){
        //block.timestamp是solidity的全局变量，直接给的
        //表示获得当前系统时间（时间戳）
        DEPLOY_TIME = block.timestamp;
    }


}
