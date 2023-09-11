package com.bogdanjmk.book_vista.dao.impl;

import com.bogdanjmk.book_vista.dao.BookOrderDAO;
import com.bogdanjmk.book_vista.entity.BookOrder;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
}
