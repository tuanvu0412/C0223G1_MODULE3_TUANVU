package com.example.ss11_jdbc.repository.iplm;

import com.example.ss11_jdbc.model.User;
import com.example.ss11_jdbc.repository.BaseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private final String INSERT_USERS_SQL = "INSERT INTO users (user_name, email, country) VALUES (?, ?, ?);";
    private final String SELECT_USER_BY_ID = "select id,user_name,email,country from users where id =?";
    private final String SELECT_ALL_USERS = "call display_all()";
    private final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private final String UPDATE_USERS_SQL = "call update_user(6,'tuanzu','vu@gmail.com','VN')";

    @Override
    public void insertUser(User user) {
        Connection connection = BaseRepository.getConnection();
        try (CallableStatement callableStatement=connection.prepareCall(INSERT_USERS_SQL)) {
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnection();
        try {
           CallableStatement callableStatement=connection.prepareCall(SELECT_USER_BY_ID);
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String user_name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, user_name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        Connection connection = BaseRepository.getConnection();
        List<User> users = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_USERS);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String user_name = resultSet.getString("user_name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id, user_name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return users;
    }

    @Override
    public void deleteUser(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement=connection.prepareCall(DELETE_USERS_SQL);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void editUser(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
           CallableStatement callableStatement=connection.prepareCall(UPDATE_USERS_SQL);
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2,user.getName());
            callableStatement.setString(3,user.getEmail());
            callableStatement.setString(4,user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User finId(int id) {
        List<User>list=selectAllUsers();
        for (int i = 0; i < list.size(); i++) {
            if(list.get(i).getId()==id){
                return list.get(i);
            }
        }
        return null;
    }

}


