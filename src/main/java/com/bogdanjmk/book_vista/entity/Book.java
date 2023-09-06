package com.bogdanjmk.book_vista.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Book {
    private Long id;
    private String book_name;
    private String author;
    private Double price;
    private String book_category;
    private String status;
    private String photo;
    private String email;

    public Book(String book_name, String author, Double price, String book_category, String status, String photo, String email) {
        this.book_name = book_name;
        this.author = author;
        this.price = price;
        this.book_category = book_category;
        this.status = status;
        this.photo = photo;
        this.email = email;
    }
}
