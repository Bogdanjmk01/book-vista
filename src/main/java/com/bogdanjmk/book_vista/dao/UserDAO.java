package com.bogdanjmk.book_vista.dao;

import com.bogdanjmk.book_vista.entity.User;

public interface UserDAO {
    boolean userRegister(User user);
    User loginUser(String email, String password);
    boolean checkPassword(Long userId, String password);
    boolean updateProfile(User user);
}
