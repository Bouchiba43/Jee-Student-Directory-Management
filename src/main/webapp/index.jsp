<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Directory Management</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-to-br from-blue-500 to-purple-600 min-h-screen flex items-center justify-center">

<div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-lg">
    <h2 class="text-3xl font-semibold text-gray-700 text-center mb-6">Student Directory Management</h2>

    <!-- Welcome Message -->
    <p class="text-gray-600 text-lg text-center mb-8">Welcome to the Student Directory Management System. You can manage student records, including adding and viewing student details.</p>

    <!-- Action Buttons -->
    <div class="space-y-6">
        <a href="studentList.jsp" class="block text-center bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 rounded-md transition duration-150 ease-in-out">
            View Students
        </a>
        <a href="studentList.jsp" class="block text-center bg-green-600 hover:bg-green-700 text-white font-semibold py-2 rounded-md transition duration-150 ease-in-out">
            Add New Student
        </a>
    </div>

    <div class="mt-8 text-center">
        <p class="text-gray-500 text-sm">
            Need help? <a href="login.jsp" class="text-blue-500 hover:text-blue-700">Login here</a> or contact your administrator.
        </p>
    </div>
</div>

</body>
</html>
