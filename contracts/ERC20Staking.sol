// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.0;

// import "hardhat/console.sol";
// import "./ERC20StakingToken.sol";
// import "./ERC20RewardToken.sol";

// contract ERC20Staking {
//     ERC20StakingToken ERC20ST =
//         ERC20StakingToken(0x8Bc4b37aff83FdA8a74d2b5732437037B801183e);
//     ERC20RewardToken RewardToken =
//         ERC20RewardToken(0xdA8a9e85bfd2EEA4750fc2bFd27d5D5f78cfe1FF);

//     struct Staker {
//         uint stakedAmount;
//         uint stakedTime;
//         uint totalReward;
//     }

//     mapping(address => Staker) stakedBalance;
//     uint private constant SecondsInOneHour = 3600;

//     event TokenStaked(address staker, uint amount);
//     event RewardClaimed(address staker, uint amount);

//     constructor() {}

//     modifier isTokenHolder() {
//         require();
//         _;
//     }

//     function stake(uint amount) external isTokenHolder {
//         //checks and confirm that the staker has the more or equal value
//         //of the tokens he.she istrying to stake
//         uint wuraTokenBalance = WuraToken.balanceOf(msg.sender);
//         require(wuraTokenBalance > 0, "You don't have Wura Tokens");

//         Staker storage _staker = stakedBalance[msg.sender];

//         //this requires that your amount you intend to stake is greater than zero(0)
//         require(amount > 0, "Staking Amount must be greater than zero(0)");

//         //This allows the transfer of then tokens from your wallet to the contract to hold
//         bool success = WuraToken.transferFrom(
//             msg.sender,
//             address(this),
//             amount
//         );

//         if (success) {
//             //if this is a first stake, set staking time as well as the amount
//             if (_staker.stakedAmount == 0) {
//                 _staker.stakedTime = block.timestamp;
//                 _staker.stakedAmount = amount;
//             }
//             //if this is not first stake, we add the staking amount to the previous
//             //staking total and as set accured reward
//             else {
//                 //increases your staked amount
//                 _staker.stakedAmount += amount;
//                 //calcaulate accured reward
//                 calculateAccuredReward();
//             }

//             emit TokenStaked(msg.sender, amount);
//         }
//         //if your staking wasn't successfull, your state reverts basc to default
//         else {
//             revert("Staking Failed");
//         }
//     }

//     function calculateAccuredReward() internal {
//         Staker storage _staker = stakedBalance[msg.sender];
//         uint difference = block.timestamp - _staker.stakedTime;

//         //formula to calculate your reward of 10% of staked token and then returns the percent in reward tokens after one hour
//         _staker.totalReward =
//             (difference * _staker.stakedAmount * 10) /
//             (SecondsInOneHour * 100);
//     }

//     function claimReward() external returns (bool success) {
//         //This makes sure the reward to be claim is below the staking
//         //contract reward token balance. If so, try again.
//         require(
//             stakedBalance[msg.sender].totalReward <
//                 BigJoeToken.balanceOf(address(this)),
//             "Try Again Later"
//         );

//         //re-calculate Accured Rewards since the last staked time
//         calculateAccuredReward();
//         uint _stakerReward = stakedBalance[msg.sender].totalReward;

//         //This makes sure the reward is above zero (0)
//         require(_stakerReward > 0, "No Reward");

//         //Using the mappedreset back the values to zero(0) to avoid re-entrancy attack
//         stakedBalance[msg.sender].totalReward = 0;
//         stakedBalance[msg.sender].stakedAmount = 0;
//         stakedBalance[msg.sender].stakedTime = 0;

//         //emit RewardClaim Event
//         emit RewardClaimed(msg.sender, _stakerReward);

//         //This pays the staker in another ERC20 tokens
//         BigJoeToken.transfer(msg.sender, _stakerReward);

//         //This returns the staked tokens
//         WuraToken.transfer(msg.sender, _stakerReward);

//         return success = true;
//     }

//     function getStakedReward(
//         address staker
//     ) public returns (uint accumulatedRewards) {
//         calculateAccuredReward();
//         accumulatedRewards = stakedBalance[staker].totalReward;
//     }
// }
