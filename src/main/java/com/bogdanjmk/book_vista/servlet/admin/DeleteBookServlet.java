package com.bogdanjmk.book_vista.servlet.admin;

import com.bogdanjmk.book_vista.dao.BookDAO;
import com.bogdanjmk.book_vista.dao.impl.BookDAOImpl;
import com.bogdanjmk.book_vista.db.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete_book")
public class DeleteBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Long id = Long.parseLong(req.getParameter("id"));

            BookDAO bookDAO = new BookDAOImpl(DatabaseConnection.getConnection());
            boolean deleteBook = bookDAO.deleteBook(id);
            HttpSession session = req.getSession();

            if (deleteBook) {
                session.setAttribute("delete_success", "Book has been deleted successfully!");
                resp.sendRedirect("admin/all_books.jsp");
            } else {
                session.setAttribute("delete_failed", "Book could not be deleted!");
                resp.sendRedirect("admin/all_books.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
