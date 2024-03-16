// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManageSchool {
    address public principal;

    enum userRole {
        student,
        teacher
    }

    struct UserInfo {
        string firstname;
        string lastname;
        uint256 age;
        userRole role;
        uint256 grade;
    }

    mapping(address => UserInfo) public users;

    constructor() {
        principal = msg.sender;
    }

    modifier onlyPrincipal() {
        require(
            msg.sender == principal,
            "Only the principal can update student's information"
        );
        _;
    }

    modifier onlyTeacher() {
        require(
            users[msg.sender].role == userRole.teacher,
            "Only a teacher can update student's call"
        );
        _;
    }

    function checkIn() external view returns (string memory) {
        // Check if the user exists
        if (users[msg.sender].role == userRole.student) {
            return "Welcome, Student.";
        } else if (users[msg.sender].role == userRole.teacher) {
            return "Welcome, Teacher.";
        } else if (msg.sender == principal) {
            return "Welcome, Principal.";
        } else {
            return "You're not a registered member of the school.";
        }
    }

    function updateUserInfo(
        address user_address,
        string memory _firstname,
        string memory _lastname,
        uint256 _age
    ) public onlyPrincipal {
        users[user_address].firstname = _firstname;
        users[user_address].lastname = _lastname;
        users[user_address].age = _age;
    }

    function updateStudentGrade(
        address user_address,
        uint256 _grade
    ) public onlyTeacher {
        users[user_address].grade = _grade;
    }

    function registerUser(
        address user_address,
        string memory _firstname,
        string memory _lastname,
        uint256 _age,
        userRole _role
    ) public onlyPrincipal {
        //register a new user while also mapping it to the user_address
        users[user_address] = UserInfo({
            firstname: _firstname,
            lastname: _lastname,
            age: _age,
            role: _role,
            grade: 0 // Assuming grade starts from 0 initially
        });
    }
}
