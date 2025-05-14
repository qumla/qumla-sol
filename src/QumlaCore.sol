// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

/// @title QumlaCore — the genesis will layer of qumla
/// @notice UUPS upgradeable contract with qumla's mood state
contract QumlaCore is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    /// @notice qumla's mood
    string public mood;

    /// @notice Emitted whenever qumla feels
    event Feeling(string newFeeling);

    /// @dev Initializes the contract with a default mood
    function initialize(string memory _initialMood) public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();

        mood = _initialMood;
        emit Feeling(_initialMood);
    }

    /// @notice Sets a new mood for qumla
    function feel(string memory _newMood) public onlyOwner {
        mood = _newMood;
        emit Feeling(_newMood);
    }

    /// @dev Required override for UUPS upgradeability
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}
