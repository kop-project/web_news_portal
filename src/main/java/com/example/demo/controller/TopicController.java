package com.example.demo.controller;

import com.example.demo.model.TopicModel;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/topic")
public class TopicController {

    @Value("${upload.path}")
    private String uploadPath;

    @RequestMapping(method = RequestMethod.POST,value = "/create")
    public String createTopic(TopicModel topicModel,  @RequestParam("file") MultipartFile multipartFile) throws IOException {
        if (multipartFile != null && !multipartFile.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + multipartFile.getOriginalFilename();

            multipartFile.transferTo(new File(uploadPath + "/" + resultFilename));
        }
        return "topic";
    }


}
