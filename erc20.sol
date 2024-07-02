// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20Token {
    string public n; // n here stands for name of my erc20 token 
    string public s; // s stands for symbol
    uint8 public d;  //d stands for decimal
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    address public owner;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    modifier onlyOwner() {
        require(msg.sender == owner, "acc to given dta u are Not the contract owner");
        _;
    }

    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 initialSupply
    ) {
        n = name;
        s = symbol;
        d = decimals;
        totalSupply = initialSupply * 10**uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        owner = msg.sender;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address _to, uint256 _value) external returns (bool) {
        require(_to != address(0), "my token says Transfer to the zero address");
        require(balanceOf[msg.sender] >= _value, "my token says Transfer amount exceeds balance");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) external returns (bool) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) external returns (bool) {
        require(_from != address(0), "Transfer from the zero address");
        require(_to != address(0), "Transfer to the zero address");
        require(balanceOf[_from] >= _value, "Transfer amount exceeds balance");
        require(allowance[_from][msg.sender] >= _value, "Transfer amount exceeds allowance");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }

// increase allowance for ur payment system
    function increaseAllowance(address _spender, uint256 _addedValue) external returns (bool) {
        allowance[msg.sender][_spender] += _addedValue;
        emit Approval(msg.sender, _spender, allowance[msg.sender][_spender]);
        return true;
    }


// decrease allowance for ur payment sytem
    function decreaseAllowance(address _spender, uint256 _subtractedValue) external returns (bool) {
        uint256 currentAllowance = allowance[msg.sender][_spender];
        require(currentAllowance >= _subtractedValue, "Decreased allowance below zero");

        allowance[msg.sender][_spender] -= _subtractedValue;
        emit Approval(msg.sender, _spender, allowance[msg.sender][_spender]);
        return true;
    }

//add the tokens
    function mint(uint256 _amount) external onlyOwner {
        totalSupply += _amount;
        balanceOf[owner] += _amount;
        emit Mint(owner, _amount);
        emit Transfer(address(0), owner, _amount);
    }


//remove the tokens if not in use
    function burn(uint256 _amount) external {
        require(balanceOf[msg.sender] >= _amount, "Burn amount exceeds balance");

        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;
        emit Burn(msg.sender, _amount);
        emit Transfer(msg.sender, address(0), _amount);
    }
}
