package com.example.ss11_jdbc.service;

import com.example.ss11_jdbc.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    public List<User> selectAllUsers();

    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    void deleteUser(int id);
    void editUser(User user);

}
