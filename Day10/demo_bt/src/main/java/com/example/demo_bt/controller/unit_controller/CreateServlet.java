package com.example.demo_bt.controller.unit_controller;


import com.example.demo_bt.model.Student;
import com.example.demo_bt.service.StudentManage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateServlet", value = "/students/create")
public class CreateServlet extends HttpServlet {

    private final StudentManage studentManage = StudentManage.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("create.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        Student student = new Student(id, name, age, gender, address);
        studentManage.addStudent(student);

        response.sendRedirect("/students");
    }
}
