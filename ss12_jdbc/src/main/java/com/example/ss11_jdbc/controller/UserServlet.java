package com.example.ss11_jdbc.controller;

import com.example.ss11_jdbc.model.User;
import com.example.ss11_jdbc.service.IUserService;
import com.example.ss11_jdbc.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name="UserServlet",value = "/user-servlet")
public class UserServlet extends HttpServlet {
    private IUserService userDAO= new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    creatNewUser(req, resp);
                    break;
                default:
                    listUser(req, resp);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "showFormCreate":
                    showFormCreate(request, response);
                default:
                    listUser(request, response);
                    break;
           }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private static void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private  void creatNewUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
       String name=request.getParameter("name");
       String gmail=request.getParameter("gmail");
       String country=request.getParameter("country");
       User user= new User(name,gmail,country);
       userDAO.insertUser(user);
        try {
            response.sendRedirect("/user-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list.jsp");
        dispatcher.forward(request, response);
    }

}
