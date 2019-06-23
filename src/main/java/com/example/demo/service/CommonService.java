package com.example.demo.service;

import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Random;

@Service
public class CommonService {

    public String generateId(String type) {
        StringBuilder sb = new StringBuilder(5);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        sb.append("." + timestamp.getTime());
        Random random = new Random();
        for (int i = 0; i < 5; i++) {
            char c = (char)(random.nextInt(26) + 'a');
            sb.append(c);
        }
        sb.append(":intech" + "." + type);
        return sb.toString();
    }
}
