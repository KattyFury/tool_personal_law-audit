pragma solidity ^0.8.20;
contract MyToken is ERC20, Ownable {
  function mint(address to, uint256 a) external onlyOwner { _mint(to, a); }
  function pause() external onlyOwner {}
}
