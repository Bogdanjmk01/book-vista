package com.bogdanjmk.book_vista.servlet.user;

import com.bogdanjmk.book_vista.dao.BookOrderDAO;
import com.bogdanjmk.book_vista.dao.CartDAO;
import com.bogdanjmk.book_vista.dao.impl.BookOrderDAOImpl;
import com.bogdanjmk.book_vista.dao.impl.CartDAOImpl;
import com.bogdanjmk.book_vista.db.DatabaseConnection;
import com.bogdanjmk.book_vista.entity.BookOrder;
import com.bogdanjmk.book_vista.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();

            Long userId = Long.parseLong(req.getParameter("userId"));
            String name = req.getParameter("user_name");
            String email = req.getParameter("email");
            String phone_number = req.getParameter("phone_number");
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String zip_code = req.getParameter("zip_code");
            String paymentType = req.getParameter("payment_method");
            Double totalPrice = Double.parseDouble(req.getParameter("totalPrice"));

            String full_address = address + ", " + landmark + ", " + city + ", " + state + ", " + zip_code;

            CartDAO cartDAO = new CartDAOImpl(DatabaseConnection.getConnection());
            List<Cart> books = cartDAO.getCartByUserId(userId);
            BookOrderDAO bookOrderDAO = new BookOrderDAOImpl(DatabaseConnection.getConnection());
            BookOrder bookOrder;
            List<BookOrder> orders = new ArrayList<>();
            Random random = new Random();

            for (Cart cart : books) {
                bookOrder = new BookOrder();

                bookOrder.setOrderId("BOOK-ORD-00" + random.nextInt(10000));
                bookOrder.setUserName(name);
                bookOrder.setEmail(email);
                bookOrder.setPhoneNumber(phone_number);
                bookOrder.setFullAddress(full_address);
                bookOrder.setBookName(cart.getBookName());
                bookOrder.setAuthor(cart.getAuthor());
                bookOrder.setPrice(totalPrice);
                bookOrder.setPaymentType(paymentType);

                orders.add(bookOrder);
            }

            if ("noSelect".equals(paymentType)) {
                session.setAttribute("failed_order", "Please select a payment method!");
                resp.sendRedirect("checkout.jsp");
            } else {
                boolean f = bookOrderDAO.saveBookOrder(orders);

                if (f) {
                    resp.sendRedirect("order_success.jsp");
                    books.clear();
                } else {
                    session.setAttribute("failed_order", "Something went wrong when trying to place the order. Please try again.");
                    resp.sendRedirect("checkout.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
