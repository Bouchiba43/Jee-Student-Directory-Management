<%--
  Created by IntelliJ IDEA.
  User: bouchiba
  Date: 11/13/24
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="model.Student, storage.DataStorage" %>
<%
    // Retrieve the student by ID if it's an edit operation
    String idParam = request.getParameter("id");
    Student student = null;
    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        for (Student s : DataStorage.getInstance().getStudents()) {
            if (s.getId() == id) {
                student = s;
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= (student != null) ? "Edit Student" : "Add Student" %>
    </title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-to-br from-purple-500 to-indigo-700 flex items-center justify-center min-h-screen">
<div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-lg">
    <h2 class="text-3xl font-semibold text-gray-800 text-center mb-6"><%= (student != null) ? "Edit Student" : "Add Student" %>
    </h2>
    <form action="students" method="post" class="space-y-6">
        <input type="hidden" name="action" value="<%= (student != null) ? "edit" : "add" %>">
        <% if (student != null) { %>
        <input type="hidden" name="id" value="<%= student.getId() %>">
        <% } %>

        <label for="name" class="block text-lg text-gray-800 font-semibold mb-2">Name:</label>
        <input class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-blue-500"
               placeholder="Enter student's name" type="text" name="name" id="name"
               value="<%= (student != null) ? student.getName() : "" %>" required><br>

        <label for="age" class="block text-lg text-gray-800 font-semibold mb-2">Age:</label>
        <input class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-blue-500"
               placeholder="Enter student's age" type="number" name="age" id="age"
               value="<%= (student != null) ? student.getAge() : "" %>" required><br>

        <label for="grade" class="block text-lg text-gray-800 font-semibold mb-2">Grade:</label>
        <input class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-blue-500"
               placeholder="Enter student's grade" type="text" name="grade" id="grade"
               value="<%= (student != null) ? student.getGrade() : "" %>" required><br>

        <button class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 rounded-md transition duration-150 ease-in-out focus:outline-none focus:ring-2 focus:ring-indigo-700"
                type="submit"><%= (student != null) ? "Update" : "Add" %> Student
        </button>
    </form>

    <div class="mt-4 text-center">
        <a href="studentList.jsp" class="text-indigo-600 hover:text-indigo-800 text-sm underline">Back to Student
            List</a>
    </div>
</div>
</body>
</html>
