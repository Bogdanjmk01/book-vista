package com.bogdanjmk.book_vista.dao.impl;

import com.bogdanjmk.book_vista.dao.CartDAO;
import com.bogdanjmk.book_vista.entity.Cart;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;

@RequiredArgsConstructor
public class CartDAOImpl implements CartDAO {

    private final Connection connection;

    @Override
    public boolean addToCart(Cart cart) {
        boolean f = false;

        try {
            String sql = """
                    INSERT INTO cart(book_id, user_id, book_name, author, price, total_price) VALUES (?, ?, ?, ?, ?, ?);
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, cart.getBookId());
            ps.setLong(2, cart.getUserId());
            ps.setString(3, cart.getBookName());
            ps.setString(4, cart.getAuthor());
            ps.setDouble(5, cart.getPrice());
            ps.setDouble(6, cart.getTotalPrice());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}
