package com.bogdanjmk.book_vista.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private Long id;
    private Long userId;
    private Long bookId;
    private String bookName;
    private String author;
    private Double price;
    private Double totalPrice;
}
