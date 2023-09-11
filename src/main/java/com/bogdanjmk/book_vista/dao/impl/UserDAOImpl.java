package com.bogdanjmk.book_vista.dao.impl;

import com.bogdanjmk.book_vista.dao.UserDAO;
import com.bogdanjmk.book_vista.entity.User;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

    @Override
    public User loginUser(String email, String password) {
        User loggedInUser = null;

        try {
            String sql = """
                    SELECT * FROM users WHERE email = ? AND password = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                loggedInUser = new User();
                loggedInUser.setId(rs.getLong("id"));
                loggedInUser.setName(rs.getString("name"));
                loggedInUser.setEmail(rs.getString("email"));
                loggedInUser.setPhone_number(rs.getString("phone_number"));
                loggedInUser.setAddress(rs.getString("address"));
                loggedInUser.setLandmark(rs.getString("landmark"));
                loggedInUser.setCity(rs.getString("city"));
                loggedInUser.setState(rs.getString("state"));
                loggedInUser.setZip_code(rs.getString("zip_code"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return loggedInUser;
    }

    @Override
    public boolean checkPassword(Long userId, String password) {
        boolean f = false;

        try {
            String sql = """
                    SELECT * FROM users WHERE id = ? AND password = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, userId);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public boolean updateProfile(User user) {
        boolean f = false;

        try {
            String sql = """
                    UPDATE users SET name = ?, email = ?, phone_number = ? WHERE id = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone_number());
            ps.setLong(4, user.getId());

            int i  = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public boolean doesUserAlreadyExists(String email) {
        try {
            String query = """
                    SELECT COUNT(id) AS count FROM users WHERE email = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int count = rs.getInt("count");

                return count > 0;
            }
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }

        return false;
    }

    @Override
    public User getUserByEmail(String email) {
        User user = null;

        try {
            String query = """
                    SELECT * FROM users WHERE email = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                user = new User();
                user.setId(rs.getLong("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }

        return user;
    }
}
