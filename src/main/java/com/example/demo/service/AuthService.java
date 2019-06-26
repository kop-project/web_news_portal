package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.regex.Pattern;

public class AuthService implements UserDetailsService {

    @Autowired
    UserRepo userRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        return userRepo.findByLogin(login);
    }

    public boolean isValidPassword(String password, String passwordConfirm){
        if(password.equals(passwordConfirm) && password.length() >= 8) {
            Pattern specSymReg = Pattern.compile(("[!@#$%]"));
            Pattern lowCaseReg = Pattern.compile(("[a-z]"));
            Pattern upCaseReg = Pattern.compile(("[A-Z]"));
            Pattern numReg = Pattern.compile(("[0-9]"));

            boolean hasSpec = specSymReg.matcher(password).find();
            boolean hasLowSym = lowCaseReg.matcher(password).find();
            boolean hasUpSym  = upCaseReg.matcher(password).find();
            boolean hasNum = numReg.matcher(password).find();

            if(hasSpec && hasLowSym && hasUpSym && hasNum){
               return true;
            }
        }
        return false;
    }

    public void saveUser(User user){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);
    }

}
