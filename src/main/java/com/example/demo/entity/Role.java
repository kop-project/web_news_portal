package com.example.demo.entity;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {

    USER, ADMIN, DELETE, EMPLOYER;

    public Object role;

    @Override
    public String getAuthority() {
        return name();
    }
}
