// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//a record of student in a university
//allows only principal to admit and exoell

contract StudentDetails{
    address principal;

    struct Student{
        string name; 
        uint age;
        string gender;

    }
    uint id;

    mapping(uint => Student) public _student;

    event Admitted(string indexed _name, string _gender, uint _age, uint _id);

    constructor(address _prin) {
        principal =_prin;
    
    }

    modifier onlyOwner(){
        require(msg.sender == principal, "Not Principal");
        _;
    }

    function admitStudent(string memory _name , string memory _gender, uint _age) external onlyOwner{
        //increase the id by 1 since the default is 0
        id = id +1;
        uint _id = id;
        //instance of the struct
        Student storage newStudent = _student[id];
        newStudent.name = _name;
        newStudent.age = _age;
        newStudent.gender = _gender;

        emit Admitted(_name, _gender, _age, _id);
    }

    function expell(uint _id) external onlyOwner{
        //Student storage newStudent = _student[id];

        delete _student[_id];
    
    }
    function getStudentDetails(uint _id) external view returns(Student memory _s) {
        _s = _student[_id];
    }

   
}