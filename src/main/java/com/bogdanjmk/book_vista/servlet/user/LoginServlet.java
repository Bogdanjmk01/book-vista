package com.bogdanjmk.book_vista.servlet.user;

import com.bogdanjmk.book_vista.dao.UserDAO;
import com.bogdanjmk.book_vista.dao.impl.UserDAOImpl;
import com.bogdanjmk.book_vista.db.DatabaseConnection;
import com.bogdanjmk.book_vista.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDAO userDAO = new UserDAOImpl(DatabaseConnection.getConnection());

            HttpSession session = req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");
            boolean rememberMe = "on".equals(req.getParameter("remember_me"));

            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User adminUser = new User();
                adminUser.setName("Admin");

                session.setAttribute("adminUser", adminUser);

                if (rememberMe) {
                    setRememberMeCookie(resp, "admin@gmail.com");
                }

                resp.sendRedirect("admin/home.jsp");
            } else {
                User user = userDAO.loginUser(email, password);

                if (user != null) {
                    session.setAttribute("userObj", user);

                    if (rememberMe) {
                        setRememberMeCookie(resp, email);
                    }

                    resp.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("login_failed", "Email or password invalid!");
                    resp.sendRedirect("login.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void setRememberMeCookie(HttpServletResponse resp, String email) {
        Cookie rememberMeCookie = new Cookie("rememberMe", email);
        rememberMeCookie.setMaxAge(30 * 24 * 60 * 60);
        rememberMeCookie.setPath("/");
        resp.addCookie(rememberMeCookie);
    }

}
