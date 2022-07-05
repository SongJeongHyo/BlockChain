//SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13; //^0.5.0;

contract StudentsCrud{

    struct Student {
        uint num;
        string name;
        bool isEnrolled;
    }

    Student[] public Students;

    function insert(uint n, string memory sn, bool e) public { //입력함수 
        Students.push(Student(n,sn,e));
    }

    function getFirstStudent() public view returns(uint getnum, string memory getname, bool getisEnrolled) { //첫 데이터 조회
        getnum = Students[0].num;
        getname = Students[0].name;
        getisEnrolled = Students[0].isEnrolled;

    }

    function findBy(uint8 index) view public returns(uint findNum, string memory findName, bool findIsEnrolled) { //검색함수 
        findNum =  Students[index].num;
        findName = Students[index].name;
        findIsEnrolled = Students[index].isEnrolled;
    }

    function remove(uint index) public{ //삭제함수 
        for(uint i = index; i < Students.length-1; i++){
            Students[i] = Students[i+1];
        }
        Students.pop();
    }

    function getLength() view public returns(uint) { //배열크기 조회함수
        return Students.length;
    }

    function pop() public { //삭제함수
        Students.pop();
    }

}
