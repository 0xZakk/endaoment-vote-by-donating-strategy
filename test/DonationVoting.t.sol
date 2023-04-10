// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "forge-std/Test.sol";
import "@endaoment/test/Entity.t.sol";

contract DonationVotingTest is EntityTokenTransactionTest {
    // this will run all tests in EntityTokenTransactionTest
    function setUp() public override {
        super.setUp();
        entity = orgFundFactory.deployOrg("someOrgId");
        testEntityType = OrgType;
    }
}
