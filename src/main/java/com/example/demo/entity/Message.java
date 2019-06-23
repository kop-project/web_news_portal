package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "messages")
public class Message {

    @Id
    private String id;

    @Column(name = "topics_id")
    private String topicsId;

    private String sender;

    private Long timestamp;

    public Message(){}

    public Message(String id, String topicsId, String sender, Long timestamp) {
        this.id = id;
        this.topicsId = topicsId;
        this.sender = sender;
        this.timestamp = timestamp;
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
