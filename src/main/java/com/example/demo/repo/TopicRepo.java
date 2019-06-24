package com.example.demo.repo;

import com.example.demo.entity.Topic;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TopicRepo extends JpaRepository<Topic, Long> {
    Topic findById(String id);

    Page<Topic> findAll(Pageable pageable);
}
