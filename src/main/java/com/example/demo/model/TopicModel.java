package com.example.demo.model;

public class TopicModel {

    private String id;
    private String displayname;
    private String description;
    private String author;
    private boolean hasMessage;

    TopicModel(){}

    public TopicModel(String id, String displayname, String description, String author, boolean hasMessage) {
        this.id = id;
        this.displayname = displayname;
        this.description = description;
        this.author = author;
        this.hasMessage = hasMessage;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDisplayname() {
        return displayname;
    }

    public void setDisplayname(String displayname) {
        this.displayname = displayname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public boolean isHasMessage() {
        return hasMessage;
    }

    public void setHasMessage(boolean hasMessage) {
        this.hasMessage = hasMessage;
    }
}

