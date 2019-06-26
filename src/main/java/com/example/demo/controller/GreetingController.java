package com.example.demo.controller;

import com.example.demo.entity.Topic;
import com.example.demo.entity.User;
import com.example.demo.repo.MessageRepo;
import com.example.demo.repo.TopicRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GreetingController {


    @Autowired
    TopicRepo topicRepo;

    @Autowired
    MessageRepo messageRepo;


    @GetMapping("/")
    public String greeting (Model model,
                           @PageableDefault(size = 4) Pageable pageable) {

        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        Page<Topic> topics = topicRepo.getSortTopic(pageable);
        model.addAttribute("user", user);
        model.addAttribute("topics", topics);
        return "greeting";
    }

}
