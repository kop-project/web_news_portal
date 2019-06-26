package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "messages")
public class Message {

    @Id
    private String id;

    @Column(name = "topic_id")
    private String topicsId;

    private String sender;

    private String content;

    private Long timestamp;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Message(){}

    public Message(String id, String topicsId, String sender, String content, Long timestamp, String type) {
        this.id = id;
        this.topicsId = topicsId;
        this.sender = sender;
        this.content = content;
        this.timestamp = timestamp;
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTopicsId() {
        return topicsId;
    }

    public void setTopicsId(String topicsId) {
        this.topicsId = topicsId;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public Long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Long timestamp) {
        this.timestamp = timestamp;
    }
}
