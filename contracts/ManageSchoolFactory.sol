// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.2;

import "./ManageSchool.sol";

contract ManageSchoolFactory {
    ManageSchool[] public SchoolManArray;

    function createNewSchoolMan() public returns (address) {
        ManageSchool manageschool = new ManageSchool();
        SchoolManArray.push(manageschool);
        return address(manageschool);
    }

    function getSchoolManAddresses()
        public
        view
        returns (ManageSchool[] memory)
    {
        return SchoolManArray;
    }
}
