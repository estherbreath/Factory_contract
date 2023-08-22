// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
 

import "./StudentDetails.sol";

contract studentDetailsFactory{
    
    StudentDetails[] Details;

    function createStudentDetails() external returns(StudentDetails newDetails) {
       
        newDetails = new StudentDetails(msg.sender);
       
        Details.push(newDetails);

    }
}