package storage;

import model.Student;
import model.Teacher;

import java.util.ArrayList;

public class DataStorage {
    private static DataStorage instance;
    private ArrayList<Student> students = new ArrayList<>();
    private ArrayList<Teacher> teachers = new ArrayList<>();

    private DataStorage() {
        teachers.add(new Teacher("bouchiba","bouchiba123"));
        students.add(new Student(1, "Ahmed", 22, "A"));
        students.add(new Student(2, "Firas", 25, "B"));
        students.add(new Student(3, "Samar", 21, "A"));
        students.add(new Student(4, "Tarek", 23, "B"));
    }

    public static DataStorage getInstance() {
        if (instance == null) {
            instance = new DataStorage();
        }
        return instance;
    }

    public ArrayList<Student> getStudents() {
        return students;
    }

    public ArrayList<Teacher> getTeachers() {
        return teachers;
    }
}
