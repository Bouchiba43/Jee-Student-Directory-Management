<%--
  Created by IntelliJ IDEA.
  User: bouchiba
  Date: 11/13/24
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${action} Student</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-to-br from-purple-500 to-indigo-700 flex items-center justify-center min-h-screen">

<div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-lg">
  <h2 class="text-3xl font-semibold text-gray-800 text-center mb-6">${action} Student</h2>

  <form id="studentForm" class="space-y-6">
    <input type="hidden" id="action" value="${action}">
    <input type="hidden" id="studentId" value="${student.id}">

    <div class="form-group mb-6">
      <label for="name" class="block text-lg text-gray-800 font-semibold mb-2">Name</label>
      <input type="text" id="name" required value="${student.name}" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-blue-500" placeholder="Enter student's name">
    </div>

    <div class="form-group mb-6">
      <label for="age" class="block text-lg text-gray-800 font-semibold mb-2">Age</label>
      <input type="number" id="age" required value="${student.age}" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-blue-500" placeholder="Enter student's age">
    </div>

    <div class="form-group mb-6">
      <label for="grade" class="block text-lg text-gray-800 font-semibold mb-2">Grade</label>
      <input type="text" id="grade" required value="${student.grade}" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-blue-500" placeholder="Enter student's grade">
    </div>

    <button type="submit" class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 rounded-md transition duration-150 ease-in-out focus:outline-none focus:ring-2 focus:ring-indigo-700">
      ${action == 'edit' ? 'Update Student' : 'Add Student'}
    </button>
  </form>

  <div class="mt-4 text-center">
    <a href="studentList.jsp" class="text-indigo-600 hover:text-indigo-800 text-sm underline">Back to Student List</a>
  </div>
</div>

<script>
  // Handle form submission (Add/Edit)
  document.getElementById('studentForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const action = document.getElementById('action').value;
    const studentId = document.getElementById('studentId').value;
    const name = document.getElementById('name').value;
    const age = document.getElementById('age').value;
    const grade = document.getElementById('grade').value;

    const student = {
      id: action === 'edit' ? studentId : Date.now(), // Use current timestamp as unique ID
      name,
      age,
      grade
    };

    let students = JSON.parse(sessionStorage.getItem('students')) || [];

    if (action === 'edit') {
      // Update student
      students = students.map(s => s.id === studentId ? student : s);
    } else {
      // Add new student
      students.push(student);
    }

    sessionStorage.setItem('students', JSON.stringify(students));
    window.location.href = 'studentList.jsp'; // Redirect back to the student list
  });

  // Load the student data into the form for editing
  window.onload = function() {
    const action = document.getElementById('action').value;
    const studentId = document.getElementById('studentId').value;

    if (action === 'edit') {
      const students = JSON.parse(sessionStorage.getItem('students')) || [];
      const student = students.find(s => s.id == studentId);

      if (student) {
        document.getElementById('name').value = student.name;
        document.getElementById('age').value = student.age;
        document.getElementById('grade').value = student.grade;
      }
    }
  };
</script>

</body>
</html>