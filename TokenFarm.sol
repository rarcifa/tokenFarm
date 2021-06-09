/*"SPDX-License-Identifier: <SPDX-License>"*/
pragma solidity >=0.5.16;
// SPDX-License-Identifier: Unlicensed
import "./DappToken.sol";
import "./DaiToken.sol";

contract TokenFarm {
    // all code goes here...
    string public name = "Dapp Token Farm";
    DappToken public dappToken;
    DaiToken public daiToken;

    address[] public stakers;

    mapping(address => uint256) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isStaking;

    // constructor functions for the Type and _address
    constructor(DappToken _dappToken, DaiToken _daiToken) public {
        dappToken = _dappToken;
        daiToken = _daiToken;
    }

    // 1. Stakes Tokens (Deposit)
    function stakeTokens(uint256 _amount) public {
        // code goes inside here...

        // transfer Mock Dai tokens to this contract for Staking
        daiToken.transferFrom(msg.sender, address(this), _amount);

        // update staking balance
        stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

        // add users to stakers array "only" if they haven't staked already
        if (!hasStaked[msg.sender]) {
            stakers.push(msg.sender);
        }

        // update staking status
        isStaking[msg.sender] = true;
        hasStaked[msg.sender] = true;
    }

    // 2. Unstaking Tokens (Withdraw)

    // 3. Issuing Tokens (Earning Interest)
}
