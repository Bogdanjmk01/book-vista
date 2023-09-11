package com.bogdanjmk.book_vista.dao.impl;

import com.bogdanjmk.book_vista.dao.BookDAO;
import com.bogdanjmk.book_vista.entity.Book;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

    @Override
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        Book book;

        try {
            String sql = """
                    SELECT * FROM books;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                book = new Book();

                book.setId(rs.getLong("id"));
                book.setBook_name(rs.getString("book_name"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setBook_category(rs.getString("book_category"));
                book.setStatus(rs.getString("status"));
                book.setPhoto(rs.getString("photo"));
                book.setEmail(rs.getString("email"));

                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }

    @Override
    public Book getBookById(Long id) {
        Book book = null;

        try {
            String sql = """
                    SELECT * FROM books WHERE id = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                book = new Book();

                book.setId(rs.getLong("id"));
                book.setBook_name(rs.getString("book_name"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setBook_category(rs.getString("book_category"));
                book.setStatus(rs.getString("status"));
                book.setPhoto(rs.getString("photo"));
                book.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return book;
    }

    @Override
    public boolean updateBook(Book book) {
        boolean f = false;

        try {
            String sql = """
                    UPDATE books SET book_name = ?, author = ?, price = ?, book_category = ?, status = ? WHERE id = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, book.getBook_name());
            ps.setString(2, book.getAuthor());
            ps.setDouble(3, book.getPrice());
            ps.setString(4, book.getBook_category());
            ps.setString(5, book.getStatus());
            ps.setLong(6, book.getId());

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
    public boolean deleteBook(Long id) {
        boolean f = false;

        try {
            String sql = """
                    DELETE FROM books WHERE id = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
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
    public List<Book> getNewBooks() {
        List<Book> newBooks = new ArrayList<>();
        Book book;

        try {
            String sql = """
                    SELECT * FROM books WHERE book_category = ? AND status = ? ORDER BY id DESC;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "NEW");
            ps.setString(2, "ACTIVE");

            ResultSet rs = ps.executeQuery();
            int i = 1;

            while (rs.next() && i <= 5) {
                book = new Book();

                book.setId(rs.getLong("id"));
                book.setBook_name(rs.getString("book_name"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setBook_category(rs.getString("book_category"));
                book.setStatus(rs.getString("status"));
                book.setPhoto(rs.getString("photo"));
                book.setEmail(rs.getString("email"));

                newBooks.add(book);
                i ++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return newBooks;
    }

    @Override
    public List<Book> getRecentBooks() {
        List<Book> recentBooks = new ArrayList<>();
        Book book;

        try {
            String sql = """
                    SELECT * FROM books WHERE status = ? ORDER BY id DESC;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "ACTIVE");

            ResultSet rs = ps.executeQuery();
            int i = 1;

            while (rs.next() && i <= 5) {
                book = new Book();

                book.setId(rs.getLong("id"));
                book.setBook_name(rs.getString("book_name"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setBook_category(rs.getString("book_category"));
                book.setStatus(rs.getString("status"));
                book.setPhoto(rs.getString("photo"));
                book.setEmail(rs.getString("email"));

                recentBooks.add(book);
                i ++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return recentBooks;
    }

    @Override
    public List<Book> getOldBooks() {
        List<Book> oldBooks = new ArrayList<>();
        Book book;

        try {
            String sql = """
                    SELECT * FROM books WHERE book_category = ? AND status = ? ORDER BY id DESC;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "OLD");
            ps.setString(2, "ACTIVE");

            ResultSet rs = ps.executeQuery();
            int i = 1;

            while (rs.next() && i <= 5) {
                book = new Book();

                book.setId(rs.getLong("id"));
                book.setBook_name(rs.getString("book_name"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setBook_category(rs.getString("book_category"));
                book.setStatus(rs.getString("status"));
                book.setPhoto(rs.getString("photo"));
                book.setEmail(rs.getString("email"));

                oldBooks.add(book);
                i ++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return oldBooks;
    }

    @Override
    public List<Book> getAllRecentBooks() {
        List<Book> recentBooks = new ArrayList<>();
        Book book;

        try {
            String sql = """
                    SELECT * FROM books WHERE status = ? ORDER BY id DESC;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "ACTIVE");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                book = new Book();

                book.setId(rs.getLong("id"));
                book.setBook_name(rs.getString("book_name"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setBook_category(rs.getString("book_category"));
                book.setStatus(rs.getString("status"));
                book.setPhoto(rs.getString("photo"));
                book.setEmail(rs.getString("email"));

                recentBooks.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return recentBooks;
    }

    @Override
    public List<Book> getAllNewBooks() {
        List<Book> newBooks = new ArrayList<>();
        Book book;

        try {
            String sql = """
                    SELECT * FROM books WHERE book_category = ? AND status = ? ORDER BY id DESC;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "NEW");
            ps.setString(2, "ACTIVE");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                book = new Book();

                book.setId(rs.getLong("id"));
                book.setBook_name(rs.getString("book_name"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setBook_category(rs.getString("book_category"));
                book.setStatus(rs.getString("status"));
                book.setPhoto(rs.getString("photo"));
                book.setEmail(rs.getString("email"));

                newBooks.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return newBooks;
    }

    @Override
    public List<Book> getAllOldBooks() {
        List<Book> oldBooks = new ArrayList<>();
        Book book;

        try {
            String sql = """
                    SELECT * FROM books WHERE book_category = ? AND status = ? ORDER BY id DESC;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "OLD");
            ps.setString(2, "ACTIVE");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                book = new Book();

                book.setId(rs.getLong("id"));
                book.setBook_name(rs.getString("book_name"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setBook_category(rs.getString("book_category"));
                book.setStatus(rs.getString("status"));
                book.setPhoto(rs.getString("photo"));
                book.setEmail(rs.getString("email"));

                oldBooks.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return oldBooks;
    }

    @Override
    public List<Book> searchBook(String name) {
        List<Book> books = new ArrayList<>();
        Book book;

        try {
            String sql = """
                    SELECT * FROM books WHERE book_name LIKE ? OR book_category LIKE ? OR author LIKE ? AND status = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + name + "%");
            ps.setString(3, "%" + name + "%");
            ps.setString(4, "ACTIVE");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                book = new Book();

                book.setId(rs.getLong("id"));
                book.setBook_name(rs.getString("book_name"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setBook_category(rs.getString("book_category"));
                book.setStatus(rs.getString("status"));
                book.setPhoto(rs.getString("photo"));
                book.setEmail(rs.getString("email"));

                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }
}
