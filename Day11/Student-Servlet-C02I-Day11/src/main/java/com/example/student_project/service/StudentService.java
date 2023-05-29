package com.example.student_project.service;

import com.example.student_project.model.Classes;
import com.example.student_project.model.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentService {
    private final List<Student> students;
    private static StudentService studentService;

    private StudentService() {
        students = new ArrayList<>();
//        students.add(new Student(1L,"Duong", 20, "Male", "HN", new Classes(1L,"C0223I1") ));
//        students.add(new Student(2L,"Dung", 21, "Male", "HN",  new Classes(2L,"C0223H1") ));
//        students.add(new Student(3L,"Thai", 22, "Male", "HN",  new Classes(3L,"C0323G1")));
    }

    public static StudentService getInstance() {
        if (studentService == null) {
            studentService = new StudentService();
        }
        return studentService;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void addStudent(Student student) {
        students.add(student);
    }

    public Student getById(Long id) {
        for (Student student : students) {
            if (student.getId().equals(id)) {
                return student;
            }
        }
        return null;
    }

    public void deleteById(Long id) {
        Student student = getById(id);
        if (student != null) {
            students.remove(student);
        }
    }

    public void deleteByClasses(Classes classes) {
        List<Student> studentDelete = new ArrayList<>();
        for (Student student : students) {
            if (student.getClasses().equals(classes)) {
                studentDelete.add(student);
            }
        }
        students.removeAll(studentDelete);
    }

    public List<Student> searchByName(String name) {
        List<Student> studentsSearch = new ArrayList<>();
        for (Student student : students) {
            if (student.getName().toLowerCase().contains(name.toLowerCase())) {
                studentsSearch.add(student);
            }
        }
        return studentsSearch;
    }
}
