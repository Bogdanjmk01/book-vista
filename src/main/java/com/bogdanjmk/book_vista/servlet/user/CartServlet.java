package com.bogdanjmk.book_vista.servlet.user;

import com.bogdanjmk.book_vista.dao.BookDAO;
import com.bogdanjmk.book_vista.dao.CartDAO;
import com.bogdanjmk.book_vista.dao.impl.BookDAOImpl;
import com.bogdanjmk.book_vista.dao.impl.CartDAOImpl;
import com.bogdanjmk.book_vista.db.DatabaseConnection;
import com.bogdanjmk.book_vista.entity.Book;
import com.bogdanjmk.book_vista.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Long bookId = Long.parseLong(req.getParameter("bookId"));
            Long userId = Long.parseLong(req.getParameter("userId"));

            BookDAO bookDAO = new BookDAOImpl(DatabaseConnection.getConnection());
            Book book = bookDAO.getBookById(bookId);

            Cart cart = new Cart();
            cart.setBookId(bookId);
            cart.setUserId(userId);
            cart.setBookName(book.getBook_name());
            cart.setAuthor(book.getAuthor());
            cart.setPrice(book.getPrice());
            cart.setTotalPrice(book.getPrice());

            CartDAO cartDAO = new CartDAOImpl(DatabaseConnection.getConnection());
            boolean f= cartDAO.addToCart(cart);

            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("addToCartSuccess", "Book was added to cart!");
                resp.sendRedirect("all_new_books.jsp");
            } else {
                session.setAttribute("addToCartFailed", "Book could not be added to cart!");
                resp.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
