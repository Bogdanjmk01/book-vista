package com.bogdanjmk.book_vista.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
    private Long id;
    private String name;
    private String email;
    private String password;
    private String phone_number;
    private String address;
    private String landmark;
    private String city;
    private String state;
    private String zip_code;
}
