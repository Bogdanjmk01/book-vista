package com.bogdanjmk.book_vista.dao;

import com.bogdanjmk.book_vista.entity.User;

public interface UserDAO {
    boolean userRegister(User user);
    public User loginUser(String email, String password);
}
