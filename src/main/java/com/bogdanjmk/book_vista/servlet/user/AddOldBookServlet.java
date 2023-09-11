package com.bogdanjmk.book_vista.servlet.user;

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

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String book_name = req.getParameter("book_name");
            String author = req.getParameter("author");
            Double price = Double.parseDouble(req.getParameter("price"));
            String categories = "OLD";
            String status = "ACTIVE";
            String email = req.getParameter("user_email");
            Part part = req.getPart("photo");
            String fileName = part.getSubmittedFileName();

            Book book = new Book(book_name, author, price, categories, status, fileName, email);
            BookDAO bookDAO = new BookDAOImpl(DatabaseConnection.getConnection());

            boolean f = bookDAO.addBook(book);
            HttpSession session = req.getSession();

            if (f) {
                String uploadDirectory = "C:\\Users\\bmocanu\\IdeaProjects\\book-vista\\src\\main\\webapp\\books\\";

                File directory = new File(uploadDirectory);
                if (!directory.exists()) {
                    directory.mkdirs();
                }

                part.write(uploadDirectory + fileName);

                session.setAttribute("success_message", "Book added successfully!");
                resp.sendRedirect("settings.jsp");
            } else {
                session.setAttribute("failed_message", "Could not add the book!");
                resp.sendRedirect("sell_book.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
