package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
import storage.DataStorage;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(StudentServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addStudent(request);
                break;
            case "edit":
                editStudent(request);
                break;
            default:
                LOGGER.warning("Unknown action: " + action);
        }

        response.sendRedirect("studentList.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            deleteStudent(request);
        }

        response.sendRedirect("studentList.jsp");
    }

    private void addStudent(HttpServletRequest request) {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String grade = request.getParameter("grade").toUpperCase();

        // Get singleton instance of DataStorage and add a new student with the next ID
        List<Student> students = DataStorage.getInstance().getStudents();
        int nextId = students.isEmpty() ? 1 : students.get(students.size() - 1).getId() + 1;
        Student student = new Student(nextId, name, age, grade.toUpperCase());
        students.add(student);
    }

    private void editStudent(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String grade = request.getParameter("grade").toUpperCase();

        List<Student> students = DataStorage.getInstance().getStudents();
        for (Student student : students) {
            if (student.getId() == id) {
                student.setName(name);
                student.setAge(age);
                student.setGrade(grade);
                break;
            }
        }
    }

    private void deleteStudent(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));

        List<Student> students = DataStorage.getInstance().getStudents();
        students.removeIf(student -> student.getId() == id);
    }
}
