package com.example.demo.controller;

import com.example.demo.entity.Message;
import com.example.demo.entity.Topic;
import com.example.demo.entity.User;
import com.example.demo.model.MessageResponse;
import com.example.demo.model.TopicModel;
import com.example.demo.repo.MessageRepo;
import com.example.demo.repo.TopicRepo;
import com.example.demo.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.UUID;

@Controller
@RequestMapping("/topic")
public class TopicController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    TopicRepo topicRepo;

    @Autowired
    MessageRepo messageRepo;


    @Autowired
    CommonService commonService;

    @RequestMapping(method = RequestMethod.POST,value = "/create")
    public String createTopic(Topic topic,
                              @RequestParam("file") MultipartFile multipartFile,
                              RedirectAttributes redirectAttributes
    ) throws IOException {
        if (multipartFile != null && !multipartFile.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + multipartFile.getOriginalFilename();

            multipartFile.transferTo(new File(uploadPath + "/" + resultFilename));
            topic.setLogo(resultFilename);
        }


        topic.setId(commonService.generateId("topic"));
        topicRepo.save(topic);

        redirectAttributes.addAttribute("topicId", topic.getId());
        return "redirect:/topic/{topicId}";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{topicId}")
    public String renderTopicPage(@PathVariable String topicId, Model model){

        Topic topic = topicRepo.findById(topicId);
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        model.addAttribute("user", user);
        model.addAttribute("topic", topic);

        return "topic";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/send_message")
    @ResponseBody
    public MessageResponse sendMessage(
            @RequestParam("topicId") String topicId,
            @RequestParam("sender") String sender,
            @RequestParam("content") String content
    ) {
        String messageId = commonService.generateId("topic");
        Long timestamp = new Timestamp(System.currentTimeMillis()).getTime();
        Message message = new Message(messageId, topicId, sender, timestamp);

        messageRepo.save(message);
        MessageResponse messageResponse = new MessageResponse(content, sender, timestamp);
        return messageResponse;
    }


}
