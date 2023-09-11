package com.bogdanjmk.book_vista.servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/searchBook")
public class SearchBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String searchBook = req.getParameter("searchBook");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
