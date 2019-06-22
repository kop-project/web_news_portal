package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.repo.UserRepo;
import com.example.demo.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class AuthController {

    @Autowired
    UserRepo userRepo;

    @Autowired
    AuthService authService;

    @GetMapping("/registration")
    public String getRegistrationPage(){
        return "registration";
    }

    @PostMapping("/registration")
    public String registrationInPortal(@Valid User user, Model model){

        if(userRepo.findByLogin(user.getLogin()) != null){
            return "registration";
        }

        if (!authService.isValidPassword(user.getPassword(), user.getPassword2())) {
            return "registration";
        }

        authService.saveUser(user);

        return "redirect:/login";
    }
}
