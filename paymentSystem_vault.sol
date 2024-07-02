// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// interface where no need to define functions , only declaration of functions will be done
interface i {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
//this is smart contract Payment system
contract PaymentSystem {
    i public immutable token;

    event Payment(address indexed from, address indexed to, uint256 value, string message);
    event Remittance(address indexed from, address indexed to, uint256 value, string message);

    constructor(address _t) {
        token = i(_t);
    }

// this function will used to make Payment from one account to other
    function makePayment(address _to, uint256 _amount, string memory _message) external {
        require(_to != address(0), "Recipient address cannot be zero");
        require(token.balanceOf(msg.sender) >= _amount, "Insufficient balance");

        require(token.transferFrom(msg.sender, _to, _amount), "Payment transfer failed");

        emit Payment(msg.sender, _to, _amount, _message);
    }


//this send function will use to send Remittance
    function send(address _to, uint256 _amount, string memory _message) external {
        require(_to != address(0), "Recipient address cannot be zero");
        require(token.balanceOf(msg.sender) >= _amount, "Insufficient balance");

        require(token.transferFrom(msg.sender, _to, _amount), "Remittance transfer failed");

        emit Remittance(msg.sender, _to, _amount, _message);
    }
}
