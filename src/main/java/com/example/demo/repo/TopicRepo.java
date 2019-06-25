package com.example.demo.repo;

import com.example.demo.entity.Message;
import com.example.demo.entity.Topic;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TopicRepo extends JpaRepository<Topic, Long> {
    Topic findById(String id);

    Page<Topic> findAll(Pageable pageable);

    public final static String SQL_GET_SORT_TOPIC = "SELECT DISTINCT ON (\"id\") * " +
            " from topics left JOIN messages ON topics.id = messages.topic_id " +
            " ORDER BY topics.id, timestamp DESC";

    @Query(value = SQL_GET_SORT_TOPIC, nativeQuery = true)
    Page<Topic> getSortTopic( Pageable pageable);
}
