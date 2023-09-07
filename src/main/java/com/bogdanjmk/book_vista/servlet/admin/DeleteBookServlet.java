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

import java.io.File;
import java.io.IOException;

@WebServlet("/delete_book")
public class DeleteBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Long id = Long.parseLong(req.getParameter("id"));

            BookDAO bookDAO = new BookDAOImpl(DatabaseConnection.getConnection());
            Book book = bookDAO.getBookById(id);
            String photoFileName = book.getPhoto();
            boolean deleteBook = bookDAO.deleteBook(id);
            HttpSession session = req.getSession();

            if (deleteBook) {
                if (photoFileName != null) {
                    File photoFile = new File("C:\\Users\\bmocanu\\IdeaProjects\\book-vista\\src\\main\\webapp\\books\\");
                    if (photoFile.exists()) {
                        photoFile.delete();
                    }
                }

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
