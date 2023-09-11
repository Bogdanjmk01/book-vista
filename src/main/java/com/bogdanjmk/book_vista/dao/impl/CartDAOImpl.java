package com.bogdanjmk.book_vista.dao.impl;

import com.bogdanjmk.book_vista.dao.CartDAO;
import com.bogdanjmk.book_vista.entity.Cart;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

    @Override
    public List<Cart> getCartByUserId(Long userId) {
        List<Cart> carts = new ArrayList<>();
        Cart cart;
        double total_price = 0.00;

        try {
            String sql = """
                    SELECT * FROM cart WHERE user_id = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cart = new Cart();

                cart.setId(rs.getLong("id"));
                cart.setBookId(rs.getLong("book_id"));
                cart.setUserId(rs.getLong("user_id"));
                cart.setBookName(rs.getString("book_name"));
                cart.setAuthor(rs.getString("author"));
                cart.setPrice(rs.getDouble("price"));

                total_price = total_price + rs.getDouble("total_price");
                cart.setTotalPrice(total_price);

                carts.add(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return carts;
    }

    @Override
    public Integer getNumberOfItemsInTheCart(Long userId) {
        int numberOfItemsInTheCart = 0;

        try {
            String sql = """
                    SELECT COUNT(DISTINCT id) FROM cart WHERE user_id = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                numberOfItemsInTheCart = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return numberOfItemsInTheCart;
    }

    @Override
    public boolean deleteBook(Long bookId, Long userId, Long cartId) {
        boolean f = false;

        try {
            String sql = """
                    DELETE FROM cart WHERE book_id = ? AND user_id = ? AND id = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, bookId);
            ps.setLong(2, userId);
            ps.setLong(3, cartId);

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
