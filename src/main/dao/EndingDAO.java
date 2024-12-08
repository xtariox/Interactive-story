package main.dao;

import main.database.DBConnection;

import java.sql.Connection;
import java.util.List;

public class EndingDAO implements DAO<Ending> {
    @Override
    public Ending get(int id) {
        String query = "SELECT * FROM endings WHERE id = ?";
        try (Connection connection = DBConnection.getConnection()) {
            assert connection != null;
            try (java.sql.PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, id);
                java.sql.ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    return new Ending(resultSet.getInt("id"),
                            resultSet.getString("title"),
                            resultSet.getString("content"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Ending> getAll() {
        return null;
    }

    @Override
    public void save(Ending ending) {
    }

    @Override
    public void update(Ending ending) {
    }

    @Override
    public void delete(Ending ending) {
    }
}
