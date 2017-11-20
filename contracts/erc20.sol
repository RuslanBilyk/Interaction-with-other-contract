pragma solidity ^0.4.15;


contract ERC20 {

	string public constant symbol = "FIX";
      string public constant name = "Example";
      uint8 public constant decimals = 4;
      uint256 _totalSupply = 1000000;
      
      
      address public owner;
   
    
      mapping(address => uint256) balances;
   
      
      mapping(address => mapping (address => uint256)) allowed;
   
    
   
      event Burn(address indexed from, uint256 value);
      event Approval(address indexed _owner, address indexed _spender, uint256 _value);
      event Transfer(address indexed from, address indexed to, uint256 value);
     
      // Constructor
      function ERC20() {
        
          owner = msg.sender;
          balances[owner] = _totalSupply;
    
      }
   
      function totalSupply() constant returns (uint256 totalSupply) {
          totalSupply = _totalSupply;
          return totalSupply;
      }
   
      function balanceOf(address _owner) constant returns (uint256 balance) {
          balance = balances[_owner];
          return balance;
      }
   
      // Transfer the balance from owner's account to another account
      function transfer(address sender,address _to, uint256 _amount) returns (bool success) {
          if  ((balances[sender] >= _amount )&&(_amount > 0) ) 
         {
              balances[sender] -= _amount;
              balances[_to] += _amount;
              Transfer(sender, _to, _amount);
              return true;
        }
           else 
          {
               return false;      
          }
      }
   
      
      function transferFrom( address _from, address _to, uint256 _amount, address sender) returns (bool success) {
         if ((balances[_from] >= _amount)&&(allowed[_from][sender] >= _amount)&&(_amount > 0))   
         {
             balances[_from] -= _amount; 
             balances[_to] += _amount;
             allowed[_from][sender] -= _amount;
             
             Transfer(_from, _to, _amount);
             return true; 
         } 
         else 
         {
            return false;
         }
     }
  
     function approve(address _spender, uint256 _amount, address sender) returns (bool success) {
         allowed[sender][_spender] = _amount;
         Approval(sender, _spender, _amount);
         return true;
     }
  
     function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
         return allowed[_owner][_spender];
     }

     function burn(uint256 _value) returns (bool success) {
        require(balances[msg.sender] >= _value);   // Check if the sender has enough
        balances[msg.sender] -= _value;            // Subtract from the sender
        _totalSupply -= _value;                      // Updates totalSupply
        Burn(msg.sender, _value);
        return true;
    }

    
    function burnFrom(address _from, uint256 _value) returns (bool success) {
        require(balances[_from] >= _value);                // Check if the targeted balance is enough
        require(allowed[_from][msg.sender] >= _value);    // Check allowance
        balances[_from] -= _value;                         // Subtract from the targeted balance
        allowed[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
        _totalSupply -= _value;                              // Update totalSupply
        Burn(_from, _value);
        return true;
    }
    function emission() returns(bool) {
      balances[owner] += _totalSupply;
      return true;
    }
    
}