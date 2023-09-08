package com.bogdanjmk.book_vista.dao;

import com.bogdanjmk.book_vista.entity.Cart;

import java.util.List;

public interface CartDAO {
    boolean addToCart(Cart cart);
    List<Cart> getCartByUserId(Long userId);
    Integer getNumberOfItemsInTheCart(Long userId);
    boolean deleteBook(Long bookId, Long userId);
}
