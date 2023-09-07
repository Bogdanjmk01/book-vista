package com.bogdanjmk.book_vista.dao;

import com.bogdanjmk.book_vista.entity.Book;

import java.util.List;

public interface BookDAO {
    boolean addBook(Book book);
    List<Book> getAllBooks();
    Book getBookById(Long id);
    boolean updateBook(Book book);
    boolean deleteBook(Long id);
    List<Book> getNewBooks();
    List<Book> getRecentBooks();
    List<Book> getOldBooks();
    List<Book> getAllRecentBooks();
    List<Book> getAllNewBooks();
    List<Book> getAllOldBooks();
}
