pragma solidity ^0.5.0;

contract ERC20Interface {
    function totalSupply() public view returns (int);
    function balanceOf(address tokenOwner) public view returns (int balance);
    
    function transfer(address to, int tokens) public returns (bool success);
    
    event Transfer(address indexed from, address indexed to, int tokens);
   
}

contract SafeMath {
    function safeAdd(int a, int b) public pure returns (int c) {
        c = a + b;
        require(c >= a);
    }
    function safeSub(int a, int b) public pure returns (int c) {
        require(b <= a); c = a - b;
    }
    
    function safeMul(int a, int b) public pure returns (int c) { c = a * b;
        require(a == 0 || c / a == b);
    }
    
    function safeDiv(int a, int b) public pure returns (int c) {
        require(b > 0);
        c = a / b;
    }
}


contract AMITY is ERC20Interface, SafeMath {
    string public name;
    string public symbol;
    int8 public decimals;
		
    int256 public _totalSupply;

    mapping(address => int) balances;
    mapping(address => mapping(address => int)) allowed;

    constructor() public {
        name = "Amity";
        symbol = "AMITY";
        decimals = 1;
        _totalSupply = 100000000;

        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function totalSupply() public view returns (int) {
        return _totalSupply  - balances[address(0)];
    }

    function balanceOf(address tokenOwner) public view returns (int balance) {
        return balances[tokenOwner];
    }

    function transfer(address to, int tokens) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }

}
