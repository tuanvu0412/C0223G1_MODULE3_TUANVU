package com.example.ss11_jdbc.repository.iplm;

import com.example.ss11_jdbc.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
     void insertUser(User user) throws SQLException;
     User selectUser(int id);
     List<User> selectAllUsers();

}
