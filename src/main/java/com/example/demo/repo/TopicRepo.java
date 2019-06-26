package com.example.demo.repo;

import com.example.demo.entity.Topic;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TopicRepo extends JpaRepository<Topic, Long> {
    Topic findById(String id);

    Page<Topic> findAll(Pageable pageable);

    public final static String SQL_GET_SORT_TOPIC = "select topics.id,  max(messages.timestamp), author, description, logo, displayname " +
            "from topics " +
            "left JOIN messages ON topics.id = messages.topic_id " +
            "group by topics.id order by  max desc ";

    public final static String SQL_GET_TOPIC_QUERY = "select topics.id,  max(messages.timestamp), author, description, logo, displayname " +
            "from topics " +
            "left JOIN messages ON topics.id = messages.topic_id group by topics.id";


    @Query(
            value = SQL_GET_SORT_TOPIC,
            countQuery = SQL_GET_TOPIC_QUERY,
            nativeQuery = true)
    Page<Topic> getSortTopic(Pageable pageable);
}
