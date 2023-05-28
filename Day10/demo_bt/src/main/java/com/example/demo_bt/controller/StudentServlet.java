package com.example.demo_bt.controller;

import com.example.demo_bt.service.StudentManage;
import com.example.demo_bt.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/students")
public class StudentServlet extends HttpServlet {
    private final StudentManage studentManage = StudentManage.getInstance();

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
                updateGet(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            default: // dùng để khi load trang http://localhost:8080/students khi bắt đầu vào chưa có action gì
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
                createPost(request,response);
                break;
            case "update":
                updatePost(request,response);
                break;
            case "search":
                search(request,response);
                break;
        }
    }

    //-------------------------------------------------------------------------------->
    //dùng để khi load trang http://localhost:8080/students khi bắt đầu vào chưa có action gì
    private void findAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("studentList", studentManage.getStudentList());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("home.jsp");
        requestDispatcher.forward(request, response);
    }


    //-------------------------------------------------------------------------------->
    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("create.jsp");
    }
    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        Student student = new Student(id, name, age, gender, address);
        studentManage.addStudent(student);

        response.sendRedirect("/students");
    }
    //-------------------------------------------------------------------------------->
    private void updateGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // lấy giá trị từ home.jsp
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = studentManage.getById(id);
        if (student != null) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("update.jsp");
            request.setAttribute("student", student);
            requestDispatcher.forward(request, response);
        } else {
            response.sendRedirect("/404.jsp");
        }
    }

    private void updatePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // lấy giá trị tu update.jsp
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        Student student = studentManage.getById(id);
        if (student != null) {
            student.setName(name);
            student.setAge(age);
            student.setGender(gender);
            student.setAddress(address);
            response.sendRedirect("/students");
        } else {
            response.sendRedirect("/404.jsp");
        }
    }

    //-------------------------------------------------------------------------------->
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        studentManage.deleteById(id);
        response.sendRedirect("/students");
    }

    //-------------------------------------------------------------------------------->
    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Student> students = studentManage.searchByName(search);
        request.setAttribute("studentList", students);
        // request.setAttribute("studentList", students); tên key bắt buộc phải giống key ban đầu để đẩy và lấy giá trị
        // trong cùng địa chỉ nếu ko sẽ tạo ra 1 đ/c khác
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("home.jsp");
        requestDispatcher.forward(request, response);
    }

}
