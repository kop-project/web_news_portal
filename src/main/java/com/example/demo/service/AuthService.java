package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.regex.Matcher;
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
        if(password.equals(passwordConfirm)) {
            Pattern specSymReg = Pattern.compile(("[!@#$%]"));
            Pattern lowCaseReg = Pattern.compile(("[a-z]"));
            Pattern upCaseReg = Pattern.compile(("[A-Z]"));
            Pattern numReg = Pattern.compile(("[0-9]"));

            Matcher specSymMatch = specSymReg.matcher(password);
            Matcher lowCaseMatch = lowCaseReg.matcher(password);
            Matcher upCaseMatch = upCaseReg.matcher(password);
            Matcher numMatch = numReg.matcher(password);

            boolean hasSpec = specSymMatch.find();
            boolean hasLowSym = lowCaseMatch.find();
            boolean hasUpSym = upCaseMatch.find();
            boolean hasNum = numMatch.find();

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
