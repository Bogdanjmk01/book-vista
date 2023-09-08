package com.bogdanjmk.book_vista.servlet.user;

import com.bogdanjmk.book_vista.dao.CartDAO;
import com.bogdanjmk.book_vista.dao.impl.CartDAOImpl;
import com.bogdanjmk.book_vista.db.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/remove_book")
public class RemoveBookCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long bookId = Long.parseLong(req.getParameter("bookId"));
        Long userId = Long.parseLong(req.getParameter("userId"));
        CartDAO cartDAO = new CartDAOImpl(DatabaseConnection.getConnection());

        boolean f = cartDAO.deleteBook(bookId, userId);
        HttpSession session = req.getSession();

        if (f) {
            session.setAttribute("success_message", "Book removed successfully!");
            resp.sendRedirect("cart.jsp");
        } else {
            session.setAttribute("failed_message", "Book could not be removed from the card!");
            resp.sendRedirect("cart.jsp");
        }
    }
}
