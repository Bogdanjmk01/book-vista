package com.bogdanjmk.book_vista.dao.impl;

import com.bogdanjmk.book_vista.dao.UserDAO;
import com.bogdanjmk.book_vista.entity.User;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;

@RequiredArgsConstructor
public class UserDAOImpl implements UserDAO {

    private final Connection connection;

    @Override
    public boolean userRegister(User user) {
        boolean f = false;

        try {
            String sql = """
                        INSERT INTO users(name, email, phone_number, password) VALUES(?, ?, ?, ?);
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone_number());
            ps.setString(4, user.getPassword());

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
