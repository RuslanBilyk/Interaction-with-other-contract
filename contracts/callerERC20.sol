pragma solidity ^0.4.15;

/**
 * The callERC20 contract does this and that...
 */

 import "./erc20.sol";
contract callERC20 {
	
	address public owner;
	
	
	function balanceOf(address contractAddress, address owner)constant returns(uint256) {
		ERC20 obj = ERC20(contractAddress);
		return obj.balanceOf(owner);
	}
	
	function transfer(address contractAddress, address to, uint256 amount) returns(bool) {
		ERC20 obj = ERC20(contractAddress);
		 obj.transfer(msg.sender, to,amount);
		return true;
	}
	function approve(address contractAddress, address spender, uint256 amount) returns(bool res) {
		ERC20 obj = ERC20(contractAddress);
		res = obj.approve(spender,amount,msg.sender);
		return res; 
	}
	function allowance(address contractAddress, address ownner, address spender) constant returns(uint256 res) {
		ERC20 obj = ERC20(contractAddress);
		res = obj.allowance(ownner, spender);
		return res;
	}
	function transferFrom(address contractAddress, address from, address to, uint256 amount) returns(bool res) {
		ERC20 obj = ERC20(contractAddress);
		res = obj.transferFrom(from,to,amount,msg.sender);
		return res;
	}
	
	function emission (address contractAddress) returns(bool) {
		ERC20 obj = ERC20(contractAddress);
		obj.emission();
		return true;
	}

	
	
}
