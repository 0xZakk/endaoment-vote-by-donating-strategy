// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/*
 * Donation Voting Proof of Concept
 *
 * This contract is a proof of concept for a voting strategy that integrates
 * donating to an Endaoment Entity and voting in a quadratic funding round held
 * on Allo.
 *
 */

import "solmate/tokens/ERC20.sol";
import "@allo/votingStrategy/IVotingStrategy.sol";
import {Entity} from "@endaoment/Entity.sol";

contract DonationVoting is IVotingStrategy {

  // --- Events ---

  /// @notice Emitted when a new vote is cast (and a donation is made)
  event VoteCast(
    address token,                // Donating token / base token
    uint256 amount,               // Amount of tokens donated
    address indexed voter,        // Address of the voter / donater
    address indexed grantAddress, // Address of the grantee (aka Entity)
    bytes32 indexed projectID     // ID of the project in the projet registry
  );

  // --- Core ---

  /// @notice Cast a vote in a quadratic funding round held on Allo and proxy donation to an Entity in Endaoment.
  /// @dev This function is called by a round contract, not by a voter.
  function vote(bytes[] calldata _encodedVotes, address _voterAddress) external

  // 1. Decode the vote / donate data
  override payable isRoundContract {
    (
      address _token,
      uint256 _amount,
      address _grantAddress,
      bytes32 _projectID
    ) = abi.decode(_encodedVotes[0], (
      address,
      uint256,
      address,
      bytes32
    ));

    // 2. Create an Entity instance
    Entity entity = Entity(payable( _grantAddress ));

    // 3. check that the token is the base token on the Entity
    require(ERC20( _token ) == entity.baseToken(), "DonationVoting: token mismatch");

    // 4. check that the amount is greater than 0
    require(_amount > 0, "DonationVoting: amount must be greater than 0");

    // 5. donate to the Entity
    entity.donate(_amount);

    // 6. emit an event (this is indexed off-chain to calculate the quadratic distribution)
    emit VoteCast(_token, _amount, _voterAddress, _grantAddress, _projectID);
  }
}
