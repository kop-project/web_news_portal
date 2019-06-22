package com.example.demo.controller;

import com.example.demo.entity.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GreetingController {

    @GetMapping("/")
    public String greeting(){

        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return "greeting";
    }



}
