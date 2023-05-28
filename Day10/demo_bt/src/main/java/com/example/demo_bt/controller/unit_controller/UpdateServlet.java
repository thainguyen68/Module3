package com.example.demo_bt.controller.unit_controller;


import com.example.demo_bt.model.Student;
import com.example.demo_bt.service.StudentManage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateServlet", value = "/students/update")
public class UpdateServlet extends HttpServlet {

    private final StudentManage studentManage = StudentManage.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
}
