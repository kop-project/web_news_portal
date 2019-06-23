package com.example.demo.repo;

import com.example.demo.entity.Message;
import com.example.demo.entity.Topic;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepo extends JpaRepository<Message, Long> {
}
