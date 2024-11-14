<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-to-br from-blue-500 to-purple-600 min-h-screen flex items-center justify-center">

<div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-lg">
    <h2 class="text-3xl font-semibold text-gray-700 text-center mb-6">Teacher Login</h2>

    <c:if test="${not empty error}">
        <div id="error-message" class="hidden mb-4 p-4 bg-red-100 text-red-800 border border-red-400 rounded-md">
            <p>${error}</p>
        </div>
    </c:if>

    <c:if test="${not empty successMessage}">
        <div id="success-message" class="hidden mb-4 p-4 bg-green-100 text-green-800 border border-green-400 rounded-md">
            <p>${successMessage}</p>
        </div>
    </c:if>

    <form action="login" method="post" class="space-y-6">
        <div>
            <label class="block text-gray-600 text-sm font-medium mb-1" for="username">Username</label>
            <input type="text" name="username" id="username" required
                   class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-blue-500">
        </div>

        <div>
            <label class="block text-gray-600 text-sm font-medium mb-1" for="password">Password</label>
            <input type="password" name="password" id="password" required
                   class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-blue-500">
        </div>

        <button type="submit"
                class="w-full btn btn-primary bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 rounded-md transition duration-150 ease-in-out focus:outline-none focus:ring-2 focus:ring-indigo-700">
            Login
        </button>
    </form>

    <p class="mt-6 text-center text-gray-500 text-sm">
        Please enter your credentials to access the student directory.
    </p>

    <div class="mt-6 text-center">
        <a href="javascript:void(0);" onclick="showPopup()" class="text-blue-500 hover:text-blue-700 text-sm">Forgot your password?</a><br>
        <a href="index.jsp" class="text-blue-500 hover:text-blue-700 text-sm" >return to homepage</a>
    </div>
</div>

<script>
    window.onload = function() {
        if (document.getElementById("error-message") && document.getElementById("error-message").innerText.trim() !== "") {
            document.getElementById("error-message").classList.remove("hidden");
        }

        if (document.getElementById("success-message") && document.getElementById("success-message").innerText.trim() !== "") {
            document.getElementById("success-message").classList.remove("hidden");
        }
    };

    function showPopup() {
        alert("It's your problem not mine");
    }
</script>

</body>
</html>
