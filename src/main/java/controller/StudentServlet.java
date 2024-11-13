package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(StudentServlet.class.getName());
    private ArrayList<Student> students = new ArrayList<>();
    private int nextId = 1;

    // Action constants
    private static final String ACTION_ADD = "add";
    private static final String ACTION_EDIT = "edit";
    private static final String ACTION_DELETE = "delete";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            // Default action
            response.sendRedirect("studentList.jsp");
            return;
        }

        try {
            switch (action) {
                case ACTION_ADD:
                    addStudent(request, response);
                    break;
                case ACTION_EDIT:
                    editStudent(request, response);
                    break;
                case ACTION_DELETE:
                    deleteStudent(request, response);
                    break;
                default:
                    listStudents(request, response);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error during doPost", e);
            request.setAttribute("error", "An unexpected error occurred. Please try again.");
            listStudents(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listStudents(request, response);
    }

    private void addStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String ageStr = request.getParameter("age");
        String grade = request.getParameter("grade");

        if (name == null || name.isEmpty() || ageStr == null || ageStr.isEmpty() || grade == null || grade.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            listStudents(request, response);
            return;
        }

        try {
            int age = Integer.parseInt(ageStr);
            Student student = new Student(nextId++, name, age, grade);
            students.add(student);
            request.setAttribute("message", "Student added successfully!");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Age must be a valid number.");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error adding student", e);
            request.setAttribute("error", "An error occurred while adding the student. Please try again.");
        }

        listStudents(request, response);
    }

    private void editStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String ageStr = request.getParameter("age");
        String grade = request.getParameter("grade");

        if (idStr == null || name == null || name.isEmpty() || ageStr == null || ageStr.isEmpty() || grade == null || grade.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            listStudents(request, response);
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            int age = Integer.parseInt(ageStr);

            boolean found = false;
            for (Student student : students) {
                if (student.getId() == id) {
                    student.setName(name);
                    student.setAge(age);
                    student.setGrade(grade);
                    request.setAttribute("message", "Student updated successfully!");
                    found = true;
                    break;
                }
            }

            if (!found) {
                request.setAttribute("error", "Student not found.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Age must be a valid number.");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error editing student", e);
            request.setAttribute("error", "An error occurred while editing the student. Please try again.");
        }

        listStudents(request, response);
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");

        if (idStr == null || idStr.isEmpty()) {
            request.setAttribute("error", "Invalid student ID.");
            listStudents(request, response);
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            boolean removed = students.removeIf(student -> student.getId() == id);
            if (removed) {
                request.setAttribute("message", "Student deleted successfully!");
            } else {
                request.setAttribute("error", "Student not found.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid student ID.");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting student", e);
            request.setAttribute("error", "An error occurred while deleting the student. Please try again.");
        }

        listStudents(request, response);
    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("students", students);
            request.getRequestDispatcher("studentList.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error listing students", e);
            request.setAttribute("error", "An error occurred while fetching the student list. Please try again.");
            request.getRequestDispatcher("studentList.jsp").forward(request, response);
        }
    }
}
