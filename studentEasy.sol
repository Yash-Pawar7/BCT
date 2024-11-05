// SPDX-License-Identifier: MIT

pragma solidity  ^0.8.20;

contract Student_Management{
    mapping (uint => bool) public isstudent;
    struct Student{
        uint stud_id;
        string stud_Name;
        string department;
    }

    Student[] Students;

    function add_student_detail(uint stud_id, string memory stud_Name, string memory department) public{
        require(isstudent[stud_id]==false, "Student already exists");
        Student memory stud_Data = Student(stud_id,stud_Name,department);
        Students.push(stud_Data);
        isstudent[stud_id]=true;
    }

    function getStudent_detail(uint id) public view returns(string memory, string memory)
    {
        require(isstudent[id], "student not present");
        for (uint i =0; i<Students.length; i++) 
        {
            if(Students[i].stud_id==id){
                return (Students[i].stud_Name,Students[i].department);
            }
        }
        return("not found", "not found");
    }

    fallback() external payable 
    {
        //Keep empty, it is used to handle unexpected calls or empty data
    }
}