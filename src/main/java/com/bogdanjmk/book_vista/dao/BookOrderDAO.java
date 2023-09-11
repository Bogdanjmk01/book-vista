package com.bogdanjmk.book_vista.dao;

import com.bogdanjmk.book_vista.entity.BookOrder;

import java.util.List;

public interface BookOrderDAO {
    boolean saveBookOrder(List<BookOrder> bookOrders);
    List<BookOrder> getOrders(String email);
    List<BookOrder> getAllOrders();
}
