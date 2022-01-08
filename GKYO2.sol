// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// contract address = 0xCEBdCB09802D792A5260532D6b8c96B823D51795

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol';

contract GKYO2 is ERC20 {
    using SafeMath for uint;
    uint maxSupply = 200000000*10**18;
    address public owner;

   constructor() ERC20('Gokyo Token 2','GKYO2') {
       _mint(msg.sender,100000000*10**18);
       owner = msg.sender;
   }

   function mintToken(address _to, uint _amount) external {
       require(msg.sender == owner,'Only Owner can mint tokens');
       require(totalSupply()+_amount <=maxSupply,'Max Supply Exceeded!');
       _mint(_to, _amount);
   }

   function burnToken(uint _amount) external {
       _burn(msg.sender,_amount);
   }
}

