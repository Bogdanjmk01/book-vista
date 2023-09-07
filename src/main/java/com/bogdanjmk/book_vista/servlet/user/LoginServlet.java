package com.bogdanjmk.book_vista.servlet.user;

import com.bogdanjmk.book_vista.dao.UserDAO;
import com.bogdanjmk.book_vista.dao.impl.UserDAOImpl;
import com.bogdanjmk.book_vista.db.DatabaseConnection;
import com.bogdanjmk.book_vista.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDAO userDAO = new UserDAOImpl(DatabaseConnection.getConnection());

            HttpSession session = req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");

            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User adminUser = new User();

                session.setAttribute("adminUser", adminUser);
                resp.sendRedirect("admin/home.jsp");
            } else {
                User user = userDAO.loginUser(email, password);

                if (user != null) {
                    session.setAttribute("userObj", user);
                    resp.sendRedirect("home.jsp");
                } else {
                    session.setAttribute("login_failed", "Email or password invalid!");
                    resp.sendRedirect("login.jsp");
                }

                resp.sendRedirect("home.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
