<%@ page import="model.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: bouchiba
  Date: 11/13/24
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="model.Student, storage.DataStorage" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Teacher" %>
<%
    Teacher teacher = (Teacher) session.getAttribute("teacher");
    if (teacher == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-to-br from-purple-500 to-blue-700 flex items-center justify-center min-h-screen text-gray-700">
<div class="bg-white shadow-xl rounded-lg p-8 w-full max-w-2xl">
    <h1 class="text-3xl font-bold text-center text-gray-800 mb-6">Hello,Professor <%= teacher.getUsername() %></h1>
    <h2 class="text-3xl font-bold text-center text-gray-800 mb-6">Student List</h2>
    <div id="message-container" class="mb-4"></div>

    <table class="w-full border border-gray-200 rounded-lg overflow-hidden">
        <thead class="bg-gradient-to-r from-indigo-500 to-indigo-600 text-white">
        <tr>
            <th class="px-4 py-3 font-semibold text-left">ID</th>
            <th class="px-4 py-3 font-semibold text-left">Name</th>
            <th class="px-4 py-3 font-semibold text-left">Age</th>
            <th class="px-4 py-3 font-semibold text-left">Grade</th>
            <th class="px-4 py-3 font-semibold text-left">Actions</th>
        </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-100">
        <%
            // Retrieve the list of students from DataStorage
            List<Student> students = DataStorage.getInstance().getStudents();
            for (Student student : students) {
        %>
        <tr class="hover:bg-gray-50">
            <td class="px-4 py-3"><%= student.getId() %></td>
            <td class="px-4 py-3"><%= student.getName() %></td>
            <td class="px-4 py-3"><%= student.getAge() %></td>
            <td class="px-4 py-3"><%= student.getGrade() %></td>
            <td class="px-4 py-3 space-x-2">
                <a href="studentForm.jsp?id=<%= student.getId() %>"
                   class="text-indigo-600 hover:text-indigo-800 font-medium">Edit</a>
                <a href="students?action=delete&id=<%= student.getId() %>"
                   class="text-red-500 hover:text-red-700 font-medium">Delete</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div class="mt-6 text-center">
        <a href="studentForm.jsp"
           class="inline-block bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 px-5 rounded-lg shadow-md transform hover:scale-105 transition-transform duration-150">
            Add New Student
        </a>
    </div>
</div>
</body>
</html>

