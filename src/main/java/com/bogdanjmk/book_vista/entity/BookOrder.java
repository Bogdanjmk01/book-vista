package com.bogdanjmk.book_vista.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookOrder {
    private Long id;
    private String orderId;
    private String userName;
    private String email;
    private String phoneNumber;
    private String bookName;
    private String author;
    private Double price;
    private String fullAddress;
    private String paymentType;
}
