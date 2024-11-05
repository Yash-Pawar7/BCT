//SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract Banking{
    mapping(address=>uint) public userAcc;
    mapping(address=>bool) public userExists;

    function createAcc(uint amount) public returns(string memory)
    {
        require(userExists[msg.sender]==false, "Account already created");
        userAcc[msg.sender]=amount;
        userExists[msg.sender]=true;
        return "Account created successfully";
    }

    function deposit(uint amount) public returns(string memory)
    {
        require(userExists[msg.sender]==true,"Account does not exist");
        require(amount>0, "Deposit amount should be greater than zero");
        userAcc[msg.sender]+=amount;
        return "Deposited Successfully";
    }

    function withdraw(uint amount) public returns(string memory)
    {
        require(userExists[msg.sender]==true, "Account does not exist");
        require(userAcc[msg.sender]>amount, "Insufficient balance");
        userAcc[msg.sender]-=amount;
        return "Withdrawn successfully";
    }

    function checkBal() public view returns(uint)
    {
        require(userExists[msg.sender]==true, "Account does not exist");
        return userAcc[msg.sender];
    }
}