package com.bogdanjmk.book_vista.dao.impl;

import com.bogdanjmk.book_vista.dao.BookDAO;
import com.bogdanjmk.book_vista.entity.Book;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;

@RequiredArgsConstructor
public class BookDAOImpl implements BookDAO {

    private final Connection connection;

    @Override
    public boolean addBook(Book book) {
        boolean f = false;

        try {
            String sql = """
                    INSERT INTO books(book_name, author, price, book_category, status, photo, email) VALUES (?, ?, ?, ?, ?, ?, ?);
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, book.getBook_name());
            ps.setString(2, book.getAuthor());
            ps.setDouble(3, book.getPrice());
            ps.setString(4, book.getBook_category());
            ps.setString(5, book.getStatus());
            ps.setString(6, book.getPhoto());
            ps.setString(7, book.getEmail());

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
