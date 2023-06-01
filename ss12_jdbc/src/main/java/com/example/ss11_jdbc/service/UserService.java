package com.example.ss11_jdbc.service;

import com.example.ss11_jdbc.model.User;
import com.example.ss11_jdbc.repository.iplm.IUserDAO;
import com.example.ss11_jdbc.repository.iplm.UserDAO;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserDAO userDAO=new UserDAO();

    @Override
    public List<User> selectAllUsers() {
        return userDAO.selectAllUsers();
    }

    @Override
    public void insertUser(User user) throws SQLException {
        userDAO.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userDAO.selectUser(id);
    }
}
