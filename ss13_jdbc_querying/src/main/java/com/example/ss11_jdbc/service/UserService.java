package com.example.ss11_jdbc.service;

import com.example.ss11_jdbc.model.User;
import com.example.ss11_jdbc.repository.iplm.IUserRepository;
import com.example.ss11_jdbc.repository.iplm.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userDAO = new UserRepository();

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

    @Override
    public void deleteUser(int id) {
        userDAO.deleteUser(id);
    }

    @Override
    public void editUser(User user) {
        userDAO.editUser(user);
    }

    @Override
    public User finId(int id) {
        return userDAO.finId(id);
    }
}
