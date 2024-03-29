// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalwaves;
    

    uint256 private seed;
    event NewWave(address indexed from,uint256 timestamp, string message);

    struct Wave{
        address waver;
        string message;
        uint256 timestamp;
    }

    Wave[] waves;

    mapping(address=>uint256) public lastWavedAt;

    constructor() payable{
        console.log("Hi This is majeed and this is my first contract");

        // set the initial seed

        seed=(block.timestamp+block.difficulty)%100;
    }


    function wave(string memory _message)public{

        require(
            lastWavedAt[msg.sender]+15 minutes <block.timestamp,"wait 15m"
        );

        lastWavedAt[msg.sender]=block.timestamp;
        
        totalwaves+=1;
        console.log("%s waved w/ message %s",msg.sender,_message);

        waves.push(Wave(msg.sender,_message,block.timestamp));

        seed = (block.difficulty + block.timestamp + seed) % 100;


        console.log("Random # generated: %d",seed);

        if(seed<50){
            console.log("%s won!",msg.sender);
        

        // give a 50% chance the the user will win the prize
        uint256 prizeAmount=0.0001 ether;
        require(
            prizeAmount<=address(this).balance,
            "Trying to withdrow more money than the contract has"
        );
        (bool success, )=(msg.sender).call{value:prizeAmount}("");
        require(success, "Faild to withdraw money from the contract");
    }

    emit NewWave(msg.sender,block.timestamp,_message);

    }

    function getAllWaves()public view returns(Wave[] memory){
        return waves;
    }
    function getTotalWaves()public view returns(uint256)
    {
        console.log("we have %d total waves!",totalwaves);
        return totalwaves;
    }
}