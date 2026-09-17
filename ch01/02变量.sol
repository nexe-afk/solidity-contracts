// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract VirableDemo{
    //声明两个状态变量
    uint num1;
    uint num2;
    //在部署的时候给状态变量赋值
    constructor(uint a,uint b){
        num1 = a;
        num2 = b;
    }
    //solidity函数的声明
    //1、必须是function开头
    //2、必须自定义函数名称，和变量命名一致
    //3、函数可以带参数，写在括号里面，也可以不带
    //4、public表示修饰的函数可以被外部调用
    //5、函数可以有返回值，如果有，用returns声明返回值类型
    function setNum(uint x,uint y) public{
        num1 = x;
        num2 = y;
    }
    //当函数有返回值的时候，函数体必须要用return返回对应的值
    //view和pure是solidity修饰函数独有的两个修饰符
    //view修饰的函数是表示引用了状态变量的值但是没有修改值
    //凡是没有修改状态变量的函数都不消耗gas
    //pure修饰的函数表示和状态变量完全无关，函数里面没有状态变量
    function addNum() public view returns(uint){
        return num1+num2;
    }
    function subNum() public view returns(uint){
        return num1-num2;//要正常运行，num1>num2
    }
}
