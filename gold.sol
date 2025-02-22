// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract JNOToken is ERC20, AccessControl {
    bytes32 public constant AUDITOR_ROLE = keccak256("AUDITOR_ROLE");

    // The constructor sets the token name to "JNO Token" and the symbol to "JNO".
    constructor() ERC20("JNO Token", "JNO") {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    /// @notice Mint tokens when verified gold is produced.
    /// @param to The recipient address.
    /// @param amount The number of tokens to mint.
    function mint(address to, uint256 amount) external onlyRole(AUDITOR_ROLE) {
        // Additional verification logic could be implemented here.
        _mint(to, amount);
    }

    /// @notice Burn tokens when gold is redeemed.
    /// @param from The address from which tokens will be burned.
    /// @param amount The number of tokens to burn.
    function burn(address from, uint256 amount) external onlyRole(AUDITOR_ROLE) {
        // Additional redemption logic could be implemented here.
        _burn(from, amount);
    }
}
