// SPDC-License-Identifier: MIT

pragma solidity ^0.8.7;

error Raffle_RaffleNotOpen();

contract Raffle {

    enum RaffleState {
        Open,
        Calculating
    }

    RaffleState public s_raffleState;
    uint256 public immutable i_entranceFee;
    address payable[] public s_players;

    event RaffleEntered(address indexed player);


    constructor(uint256 entranceFee){
        i_entranceFee = entranceFee;
    }

    function enterRaffle() external payable {
        require(msg.value > i_entranceFee, 'Not enough entrance fee!');
        
        ///open, calculating a winer
        if(s_raffleState != RaffleState.Open){
            revert Raffle_RaffleNotOpen();
        }

        s_players.push(payable(msg.sender));

        emit RaffleEntered(msg.sender);

    }
}


