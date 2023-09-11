package com.bogdanjmk.book_vista.dao.impl;

import com.bogdanjmk.book_vista.dao.BookOrderDAO;
import com.bogdanjmk.book_vista.entity.BookOrder;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
public class BookOrderDAOImpl implements BookOrderDAO {

    private final Connection connection;

    @Override
    public boolean saveBookOrder(List<BookOrder> bookOrders) {
        boolean f = false;

        try {
            String sql = """
                    INSERT INTO book_order(order_id, user_name, email, address, phone_number, book_name, author, price, payment_method) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);
                    """;

            connection.setAutoCommit(false);
            PreparedStatement ps = connection.prepareStatement(sql);

            for (BookOrder bookOrder : bookOrders) {
                ps.setString(1, bookOrder.getOrderId());
                ps.setString(2, bookOrder.getUserName());
                ps.setString(3, bookOrder.getEmail());
                ps.setString(4, bookOrder.getFullAddress());
                ps.setString(5, bookOrder.getPhoneNumber());
                ps.setString(6, bookOrder.getBookName());
                ps.setString(7, bookOrder.getAuthor());
                ps.setDouble(8, bookOrder.getPrice());
                ps.setString(9, bookOrder.getPaymentType());
                ps.addBatch();
            }

            int[] count = ps.executeBatch();
            connection.commit();
            f = true;
            connection.setAutoCommit(true);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<BookOrder> getOrders(String email) {
        List<BookOrder> orders = new ArrayList<>();
        BookOrder bookOrder;

        try {
            String sql = """
                    SELECT * FROM book_order WHERE email = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                bookOrder = new BookOrder();

                bookOrder.setId(rs.getLong(1));
                bookOrder.setOrderId(rs.getString(2));
                bookOrder.setUserName(rs.getString(3));
                bookOrder.setEmail(rs.getString(4));
                bookOrder.setFullAddress(rs.getString(5));
                bookOrder.setPhoneNumber(rs.getString(6));
                bookOrder.setBookName(rs.getString(7));
                bookOrder.setAuthor(rs.getString(8));
                bookOrder.setPrice(rs.getDouble(9));
                bookOrder.setPaymentType(rs.getString(10));

                orders.add(bookOrder);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public List<BookOrder> getAllOrders() {
        List<BookOrder> orders = new ArrayList<>();
        BookOrder bookOrder;

        try {
            String sql = """
                    SELECT * FROM book_order;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                bookOrder = new BookOrder();

                bookOrder.setId(rs.getLong(1));
                bookOrder.setOrderId(rs.getString(2));
                bookOrder.setUserName(rs.getString(3));
                bookOrder.setEmail(rs.getString(4));
                bookOrder.setFullAddress(rs.getString(5));
                bookOrder.setPhoneNumber(rs.getString(6));
                bookOrder.setBookName(rs.getString(7));
                bookOrder.setAuthor(rs.getString(8));
                bookOrder.setPrice(rs.getDouble(9));
                bookOrder.setPaymentType(rs.getString(10));

                orders.add(bookOrder);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
}
