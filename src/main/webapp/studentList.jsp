<%@ page import="model.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: bouchiba
  Date: 11/13/24
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student List</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-to-br from-purple-500 to-indigo-700 flex items-center justify-center min-h-screen">

<div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-lg">
    <h2 class="text-3xl font-semibold text-gray-800 text-center mb-6">Student List</h2>

    <!-- Success message -->
    <div id="message-container"></div>

    <table class="min-w-full table-auto" id="student-table">
        <thead>
        <tr>
            <th class="text-left px-4 py-2">ID</th>
            <th class="text-left px-4 py-2">Name</th>
            <th class="text-left px-4 py-2">Age</th>
            <th class="text-left px-4 py-2">Grade</th>
            <th class="text-left px-4 py-2">Actions</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

    <!-- Add new student button -->
    <div class="mt-4 text-center">
        <a href="studentForm.jsp?action=add" class="bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 px-4 rounded">Add New Student</a>
    </div>
</div>

<script>
    // Function to load students from sessionStorage and render the table
    function loadStudents() {
        const students = JSON.parse(sessionStorage.getItem('students')) || [];
        const tableBody = document.querySelector('#student-table tbody');
        tableBody.innerHTML = ''; // Clear previous rows

        students.forEach(student => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td class="px-4 py-2">${student.id}</td>
                <td class="px-4 py-2">${student.name}</td>
                <td class="px-4 py-2">${student.age}</td>
                <td class="px-4 py-2">${student.grade}</td>
                <td class="px-4 py-2">
                    <a href="studentForm.jsp?action=edit&id=${student.id}" class="text-blue-500 hover:text-blue-700">Edit</a> |
                    <a href="javascript:void(0);" onclick="deleteStudent(${student.id})" class="text-red-500 hover:text-red-700">Delete</a>
                </td>
            `;
            tableBody.appendChild(row);
        });
    }

    // Function to delete a student
    function deleteStudent(studentId) {
        let students = JSON.parse(sessionStorage.getItem('students')) || [];
        students = students.filter(student => student.id !== studentId); // Remove student by id
        sessionStorage.setItem('students', JSON.stringify(students)); // Save back to sessionStorage
        loadStudents(); // Reload the student list
    }

    // Load students when the page loads
    window.onload = loadStudents;
</script>

</body>
</html>