package com.bogdanjmk.book_vista.servlet;

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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("fullName");
            String email = req.getParameter("email");
            String phone_number = req.getParameter("phone_number");
            String password = req.getParameter("password");
            String agreeTerms = req.getParameter("check");

            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPhone_number(phone_number);
            user.setPassword(password);

            HttpSession session = req.getSession();

            if (agreeTerms != null) {
                UserDAO userDAO = new UserDAOImpl(DatabaseConnection.getConnection());
                boolean canRegisterUser = userDAO.userRegister(user);

                if (canRegisterUser) {
                    session.setAttribute("register_success", "You have registered successfully!");
                    resp.sendRedirect("login.jsp");
                } else {
                    session.setAttribute("register_failed", "Something went wrong on the server side!");
                    resp.sendRedirect("register.jsp");
                }

            } else {
                session.setAttribute("register_failed", "Please Check Agree & Terms Condition to be able to register!");
                resp.sendRedirect("register.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
