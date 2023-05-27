package com.example.bai_tap;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "StudentServlet", value = "/")
public class StudentServlet extends HttpServlet {
    public static  List<Student> studentList = new ArrayList<>();
    Student student = new Student(1,"Thái");
    Student student1 = new Student(2,"Thái 1 ");
    Student student2 = new Student(3,"Thái 2");

    @Override
    public void init() throws ServletException {
        studentList.add(student);
        studentList.add(student1);
        studentList.add(student2);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("key1",studentList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Home.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
