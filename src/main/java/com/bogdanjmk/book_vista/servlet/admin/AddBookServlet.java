package com.bogdanjmk.book_vista.servlet.admin;

import com.bogdanjmk.book_vista.dao.BookDAO;
import com.bogdanjmk.book_vista.dao.impl.BookDAOImpl;
import com.bogdanjmk.book_vista.db.DatabaseConnection;
import com.bogdanjmk.book_vista.entity.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;

@WebServlet("/add_books")
@MultipartConfig
public class AddBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String book_name = req.getParameter("book_name");
            String author = req.getParameter("author");
            Double price = Double.parseDouble(req.getParameter("price"));
            String categories = req.getParameter("book_category");
            String status = req.getParameter("status");
            Part part = req.getPart("photo");
            String fileName = part.getSubmittedFileName();

            Book book = new Book(book_name, author, price, categories, status, fileName, "admin@gmail.com");
            BookDAO bookDAO = new BookDAOImpl(DatabaseConnection.getConnection());

            boolean f = bookDAO.addBook(book);
            HttpSession session = req.getSession();

            if (f) {
                String path = getServletContext().getRealPath("") + "books";
                File file = new File(path);
                part.write(path + File.separator + fileName);

                session.setAttribute("success_message", "Book added successfully!");
                resp.sendRedirect("admin/home.jsp");
            } else {
                session.setAttribute("failed_message", "Could not add the book!");
                resp.sendRedirect("admin/add_books.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
