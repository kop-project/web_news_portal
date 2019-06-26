package com.example.demo.repo;

import com.example.demo.entity.Message;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MessageRepo extends JpaRepository<Message, Long> {

    public final static String SQL_GET_MESSAGES = "SELECT * " +
            "FROM messages " +
            "WHERE topic_id = :topics_id " +
            "ORDER BY timestamp desc";

    @Query(value = SQL_GET_MESSAGES, nativeQuery = true)
    Page<Message> getMessages(@Param("topics_id") String topics_id, Pageable pageable);

    Message findById(String id);

    void deleteById(String id);
}



