package com.example.student_project.controller;

import com.example.student_project.model.Classes;
import com.example.student_project.model.Student;
import com.example.student_project.service.ClassesService;
import com.example.student_project.service.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = "/students")
public class StudentServlet extends HttpServlet {

    private final StudentService studentService = StudentService.getInstance();
    private final ClassesService classesService = ClassesService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createGet(request, response);
                break;
            case "update":
                updateGet(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                findAdd(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createPost(request, response);
                break;
            case "update":
                updatePost(request, response);
                break;
            case "search":
                search(request, response);
                break;
        }
    }

    private void findAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("students", studentService.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/student/home.jsp");
        requestDispatcher.forward(request, response);
    }

    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("classes", classesService.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/student/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        studentService.addStudent(request);
        response.sendRedirect("/students");
    }

    private void updateGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (checkById(request)) {
        Long id = Long.parseLong(request.getParameter("id"));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/student/update.jsp");
        request.setAttribute("classes", classesService.findAll());
        request.setAttribute("students", studentService.getById(id));
        requestDispatcher.forward(request, response);
        } else {
            response.sendRedirect("/404.jsp");
        }
    }

    private void updatePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (checkById(request)) {
            studentService.updateStudent(request);
            response.sendRedirect("/students");
        } else {
            response.sendRedirect("/404.jsp");
        }

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (checkById(request)) {
            Long id = Long.parseLong(request.getParameter("id"));
            studentService.deleteById(id);
            response.sendRedirect("/students");
        } else {
            response.sendRedirect("/404.jsp");
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Student> students = studentService.searchByName(search);
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/student/home.jsp");
        requestDispatcher.forward(request, response);
    }

    private boolean checkById(HttpServletRequest request) {
        Long id = Long.parseLong(request.getParameter("id"));
        Student student = studentService.getById(id);
        return student != null;
    }
}
