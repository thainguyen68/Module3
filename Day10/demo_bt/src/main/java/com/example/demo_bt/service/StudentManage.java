package com.example.demo_bt.service;

import com.example.demo_bt.model.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentManage {
    private List<Student> studentList;
    private static StudentManage studentManage;

    public StudentManage() {
        studentList = new ArrayList<>();
        studentList.add(new Student(1, "Thai", 23, "Male", "HN"));
        studentList.add(new Student(2, "Duong", 21, "Male", "HN"));
        studentList.add(new Student(3, "Dung", 20, "Male", "HN"));
    }


    public static StudentManage getInstance() {
        if (studentManage == null) {
            studentManage = new StudentManage();
        }
        return studentManage;
    }

    public List<Student> getStudentList() {
        return studentList;
    }

    //    ---------------------------------------------------------->
    public void addStudent(Student student) {
        studentList.add(student);
    }

    public Student getById(int id) {
        for (Student s : studentList) {
            if (s.getId() == id) {
                return s;
            }
        }
        return null;
    }

    public void deleteById(int id) {
        Student student = getById(id);
        if (student != null) {
            studentList.remove(student);
        }
    }

    public List<Student> searchByName(String name) {
        List<Student> studentsSearch = new ArrayList<>();
        for (Student student : studentList) {
            if (student.getName().toUpperCase().contains(name.toUpperCase())) {
                studentsSearch.add(student);
            }
        }
        return studentsSearch;
    }

}
