// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Test9 {
    struct User {
        string name;
        string email;
        string pass;
        string specialty;
        string phoneNumber;
        string professionalAddress;
        string countryRegion;
        string professionalID;
        string photo;
        string consultationHours;
        string fees;
    }

    struct Patient {
        string name;
        string email;
         string pass;

        string phoneNumber;
        string addres;
        string medicalHistory;
        string professionalID; // Champ pour référencer l'identifiant professionnel du médecin
    }

    User[] public users;
    Patient[] public patients;

    function addUser(
        string memory _name, 
        string memory _email, 
        string memory _pass,
        string memory _specialty, 
        string memory _phoneNumber, 
        string memory _professionalAddres,
        string memory _countryRegion,
        string memory _professionalID,
        string memory _photo,
        string memory _consultationHours, 
        string memory _fees
    ) external {
        User memory newUser = User(
            _name,
            _email,
            _pass,
            _specialty,
            _phoneNumber,
            _professionalAddres,
            _countryRegion,
            _professionalID,
            _photo,
            _consultationHours,
            _fees
        );
        users.push(newUser);
    }

    function addPatient(
        string memory _name,
        string memory _email,
        string memory _pass,
        string memory _phoneNumber,
        string memory _addres,
        string memory _medicalHistory,
        string memory _professionalID // Ajout de l'identifiant professionnel du médecin
    ) external {
        Patient memory newPatient = Patient(
            _name,
            _email,
            _pass,
            _phoneNumber,
            _addres,
            _medicalHistory,
            _professionalID // Attribution de l'identifiant professionnel du médecin
        );
        patients.push(newPatient);
    }

    function updateUserFees(uint256 index, string memory newFees) external {
        require(index < users.length, "Index out of bounds");
        users[index].fees = newFees;
    }
    
    function updatePatient(
        uint256 index,
        string memory _name,
        string memory _email,
         string memory _pass,
        string memory _phoneNumber,
        string memory _addres,
        string memory _medicalHistory,
        string memory _professionalID
    ) external {
        require(index < patients.length, "Index out of bounds");
        patients[index] = Patient(
            _name,
            _email,
            _pass,
            _phoneNumber,
            _addres,
            _medicalHistory,
            _professionalID
        );
    }


    function getUserBasicInfo(uint256 index) external view returns (string memory, string memory, string memory) {
        require(index < users.length, "Index out of bounds");
        return (users[index].name, users[index].email, users[index].pass);
    }

    function getUserProfile(uint256 index) external view returns (string memory, string memory, string memory, string memory, string memory, string memory) {
        require(index < users.length, "Index out of bounds");
        return (users[index].specialty, users[index].phoneNumber, users[index].professionalAddress, users[index].countryRegion, users[index].professionalID, users[index].photo);
    }

    function getUserSchedule(uint256 index) external view returns (string memory, string memory) {
        require(index < users.length, "Index out of bounds");
        return (users[index].consultationHours, users[index].fees);
    }
    
    function getPatientBasicInfo(uint256 index) external view returns (string memory, string memory, string memory,string memory) {
        require(index < patients.length, "Index out of bounds");
        return (patients[index].name, patients[index].email,patients[index].pass, patients[index].phoneNumber);
    }

function getPatientProfile(uint256 index) external view returns (string memory, string memory, string memory) {
    require(index < patients.length, "Index out of bounds");
    return (patients[index].addres, patients[index].medicalHistory, patients[index].professionalID);
}



    function patientsLength() external view returns (uint256) {
        return patients.length;
    }
    
    function usersLength() external view returns (uint256) {
        return users.length;
    }
}


