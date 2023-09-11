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

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            Long userId = Long.parseLong(req.getParameter("userId"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phone_number = req.getParameter("phone_number");
            String password = req.getParameter("password");

            User user = new User();
            user.setId(userId);
            user.setName(name);
            user.setEmail(email);
            user.setPhone_number(phone_number);

            HttpSession session = req.getSession();
            UserDAO userDAO = new UserDAOImpl(DatabaseConnection.getConnection());
            boolean f = userDAO.checkPassword(userId, password);

            if (f) {
                boolean f2 = userDAO.updateProfile(user);

                if (f2) {
                    session.setAttribute("success_message", "Successfully update your profile!");
                    resp.sendRedirect("settings.jsp");
                } else {
                    session.setAttribute("failed_message", "Could not update your profile!");
                    resp.sendRedirect("edit_profile.jsp");
                }
            } else {
                session.setAttribute("failed_message", "Your password is incorrect");
                resp.sendRedirect("edit_profile.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
