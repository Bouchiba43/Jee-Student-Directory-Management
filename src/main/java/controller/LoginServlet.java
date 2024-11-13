package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final String USERNAME = "bouchiba";
    private static final String PASSWORD = "bouchiba123";
    private static final int SESSION_TIMEOUT = 30 * 60;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate input
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "Both username and password are required.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Check credentials
        if (USERNAME.equals(username) && PASSWORD.equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("authenticated", true);
            session.setMaxInactiveInterval(SESSION_TIMEOUT);
            response.sendRedirect("studentList.jsp");
        } else {
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && Boolean.TRUE.equals(session.getAttribute("authenticated"))) {
            response.sendRedirect("studentList.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }

}
