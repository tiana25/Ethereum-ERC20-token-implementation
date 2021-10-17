pragma solidity 0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/24a0bc23cfe3fbc76f8f2510b78af1e948ae6651/contracts/utils/math/SafeMath.sol";


contract TetianaSkazhenykSmartContract is ERC20 {
    event Received(address, uint);
     using SafeMath for uint256;
    
    address _owner;
    
    constructor() ERC20("TetianaSkazhenyknToken", "TSt") {
        _owner=msg.sender;
    }
   
    receive() external payable {
         emit Received(msg.sender, msg.value);
        require(msg.value != 0, "No ether received");
        uint256 amountToSend = SafeMath.mul(msg.value, 100);
        _mint(_owner,msg.value);
        _mint(msg.sender, amountToSend);
    }
}
