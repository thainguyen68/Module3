package com.example.student_project.service;

import com.example.student_project.model.Classes;

import java.util.ArrayList;
import java.util.List;

public class ClassManage {
    private final List<Classes> classList;
    private static ClassManage classManage;

    public ClassManage() {
        classList = new ArrayList<>();
        classList.add(new Classes(1, "12A"));
        classList.add(new Classes(2, "12B"));
        classList.add(new Classes(3, "12C"));
    }

    public static ClassManage getInstance() {
        if (classManage == null) {
            classManage = new ClassManage();
        }
        return classManage;
    }

    public List<Classes> getClassList() {
        return classList;
    }



    //----------------------------------------------------------------------->
    public static Classes getClasses(String name) {
        for (Classes classes: classManage.classList){
            if (classes.getNameClass().equals(name)){
                return classes;
            }
        }
        return null;
    }



}
