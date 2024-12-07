package main.dao;

import main.database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ChapterDAO implements DAO<Chapter> {
    @Override
    public Chapter get(int id) {
        String query = "SELECT chapters.id AS chapter_id, chapters.title AS chapter_title, chapters.content AS chapter_content, choices.id AS choice_id, choices.text AS choice_text, choices.next_chapter_id AS next_chapter_id, choices.ending_id AS ending_id FROM\n" +
                       "chapters JOIN choices ON chapters.id = choices.chapter_id WHERE chapters.id = ?";
        try (Connection connection = DBConnection.getConnection()) {
            assert connection != null;
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, id);
                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    Chapter chapter = new Chapter(resultSet.getInt("chapter_id"),
                            resultSet.getString("chapter_title"),
                            resultSet.getString("chapter_content"));
                    do {
                        if (resultSet.getObject("next_chapter_id") != null) {
                            chapter.addChoice(new Choice(resultSet.getInt("choice_id"),
                                    resultSet.getString("choice_text"),
                                    resultSet.getInt("next_chapter_id"),
                                    0));
                        } else {
                            chapter.addChoice(new Choice(resultSet.getInt("choice_id"),
                                    resultSet.getString("choice_text"),
                                    -1,
                                    resultSet.getInt("ending_id")));
                        }
                    } while (resultSet.next());
                    return chapter;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Chapter> getAll() {
        return null;
    }

    @Override
    public void save(Chapter chapter) {
    }

    @Override
    public void update(Chapter chapter) {
    }

    @Override
    public void delete(Chapter chapter) {
    }
}
