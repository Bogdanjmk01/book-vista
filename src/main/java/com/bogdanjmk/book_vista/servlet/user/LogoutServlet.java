package com.bogdanjmk.book_vista.servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            Object userObj = session.getAttribute("userObj");
            Object adminUser = session.getAttribute("adminUser");

            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("rememberMe".equals(cookie.getName())) {
                        cookie.setMaxAge(0);
                        resp.addCookie(cookie);
                        break;
                    }
                }
            }

            if (userObj != null || adminUser != null) {
                session.invalidate();
                HttpSession session2 = req.getSession();
                session2.setAttribute("logout_success", "You have been logged out successfully!");
            }

            resp.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

