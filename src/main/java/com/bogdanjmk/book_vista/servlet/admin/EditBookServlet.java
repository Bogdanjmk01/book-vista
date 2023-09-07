package com.bogdanjmk.book_vista.servlet.admin;

import com.bogdanjmk.book_vista.dao.BookDAO;
import com.bogdanjmk.book_vista.dao.impl.BookDAOImpl;
import com.bogdanjmk.book_vista.db.DatabaseConnection;
import com.bogdanjmk.book_vista.entity.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/edit_book")
public class EditBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Long id = Long.parseLong(req.getParameter("id"));
            String book_name = req.getParameter("book_name");
            String author = req.getParameter("author");
            Double price = Double.parseDouble(req.getParameter("price"));
            String status = req.getParameter("status");

            Book book = new Book();
            book.setId(id);
            book.setBook_name(book_name);
            book.setAuthor(author);
            book.setPrice(price);
            book.setStatus(status);
            System.out.println(book.getStatus());

            BookDAO bookDAO = new BookDAOImpl(DatabaseConnection.getConnection());
            boolean updateBook = bookDAO.updateBook(book);

            HttpSession session = req.getSession();

            if (updateBook) {
                session.setAttribute("update_success", "Book has been updated successfully!");
                resp.sendRedirect("admin/all_books.jsp");
            } else {
                session.setAttribute("update_failed", "Could not update book!");
                resp.sendRedirect("admin/edit_book.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
