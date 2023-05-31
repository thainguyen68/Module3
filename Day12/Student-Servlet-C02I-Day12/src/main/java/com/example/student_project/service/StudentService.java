package com.example.student_project.service;

import com.example.student_project.DAO.ClassesDAO;
import com.example.student_project.DAO.StudentsDAO;
import com.example.student_project.model.Classes;
import com.example.student_project.model.Student;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class StudentService {
    private final List<Student> students;
    private static StudentService studentService;
    private static ClassesService classesService = ClassesService.getInstance();
    private final StudentsDAO studentsDAO;


    private StudentService() {
        students = new ArrayList<>();
        studentsDAO = new StudentsDAO();

    }

    public static StudentService getInstance() {
        if (studentService == null) {
            studentService = new StudentService();
        }
        return studentService;
    }

    public List<Student> findAll() {
        return studentsDAO.findAll();
    }

    public void addStudent(HttpServletRequest request) {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        Long classId = Long.parseLong(request.getParameter("classes"));
        Classes classes = classesService.getById(classId);
        studentsDAO.addStudents(new Student(name,age,gender,address,classes));
    }

    public void updateStudent(HttpServletRequest request) {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        Long classId = Long.parseLong(request.getParameter("classes"));
        Classes classes = classesService.getById(classId);

        studentsDAO.updateStudent(new Student(id,name,age, gender, address,classes));
    }

    public Student getById(Long id) {
    return  studentsDAO.findById(id);
    }

    public void deleteById(Long id) {
      studentsDAO.deleteById(id);
    }

    public void deleteByClasses(Long id) {
       studentsDAO.deleteByClassId(id);
    }

    public List<Student> searchByName(String name) {
        List<Student> studentsSearch = new ArrayList<>();
        for (Student student : students) {
            if (student.getName().contains(name)) {
                studentsSearch.add(student);
            }
        }
        return studentsSearch;
    }
}
