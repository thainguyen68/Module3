package com.example.student_project.model;

public class Classes {
    private long idClass;
    private String nameClass;

    public Classes() {
    }

    public Classes(long idClass, String nameClass) {
        this.idClass = idClass;
        this.nameClass = nameClass;
    }

    public long getIdClass() {
        return idClass;
    }

    public void setIdClass(long idClass) {
        this.idClass = idClass;
    }

    public String getNameClass() {
        return nameClass;
    }

    public void setNameClass(String nameClass) {
        this.nameClass = nameClass;
    }

    @Override
    public String toString() {
        return nameClass;
    }
}
