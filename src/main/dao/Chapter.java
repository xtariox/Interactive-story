package main.dao;

import java.util.Collections;
import java.util.List;

public class Chapter {
    protected int id;
    protected String title;
    protected String content;
    private final List<Choice> choices = new java.util.ArrayList<>();

    public Chapter(int id, String title, String content) {
        this.id = id;
        this.title = title;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public final List<Choice> getChoices() {
        return Collections.unmodifiableList(choices);
    }

    public final void addChoice(Choice choice) {
        choices.add(choice);
    }
}
