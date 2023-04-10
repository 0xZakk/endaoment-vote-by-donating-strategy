# Endaoment x Gitcoin Allo Donation Voting POC

This is a proof of concept (POC) for a possible integration between
between
[Endaoment](https://github.com/endaoment/endaoment-contracts-v2/tree/main/src/test)
and Gitcoin's [Allo Protocol](https://github.com/allo-protocol/contracts).

## Purpose

The purpose of this repository is to showcase one way in which we could
integrate donation behavior on Endaoment with voting in a quadratic funding
round on Allo Protocol. This would allow Endaoment to leverage it's existing
system and use donations as "votes". 

## Technical Explanation

Allo Protocol distributes funding in Rounds: contracts that hold funding and
distribute it according to a Voting Strategy and a Payout Strategy, where the
Voting Strategy is a contract that decides how the funds should be allocated and
the Payout Strategy is a contract that decides how the funds should be
distributed.

Endaoment 




## Disclaimer

*These smart contracts are being provided as is. No guarantee, representation or
warranty is being made, express or implied, as to the safety or correctness of
the user interface or the smart contracts. They have not been audited and as
such there can be no assurance they will work as intended, and users may
experience delays, failures, errors, omissions, loss of transmitted information
or loss of funds. The creators are not liable for any of the foregoing. Users
should proceed with caution and use at their own risk.*

See [LICENSE](./LICENSE) for more details.
