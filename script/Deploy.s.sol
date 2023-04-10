// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import {Script} from 'forge-std/Script.sol';

import {DonationVoting} from "src/DonationVoting.sol";

/// @notice A very simple deployment script
contract Deploy is Script {

  /// @notice The main script entrypoint
  function run() external returns (DonationVoting votingStrategy) {
    vm.startBroadcast();
    votingStrategy = new DonationVoting();
    vm.stopBroadcast();
  }
}
