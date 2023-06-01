package com.example.ss11_mvc.controller;

import com.example.ss11_mvc.model.Product;
import com.example.ss11_mvc.service.IProductService;
import com.example.ss11_mvc.service.ProductService;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ProductServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {
    private IProductService iProductService = new ProductService();
    private List<Product> list = iProductService.displayList();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "find":
                req.setAttribute("list", findByName(req,resp));
                RequestDispatcher requestDispatcher2 = req.getRequestDispatcher("display.jsp");
                requestDispatcher2.forward(req, resp);
                break;
            case "showListAdd":
                showListAdd(req, resp);
                break;
            default:
                req.setAttribute("list", list);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("display.jsp");
                requestDispatcher.forward(req, resp);
        }
    }

    private static void showListAdd(HttpServletRequest req, HttpServletResponse resp) {
       RequestDispatcher requestDispatcher= req.getRequestDispatcher("add.jsp");
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addNewProduct(req, resp);
                break;
            case "edit":
                editProduct(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            default:
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("display.jsp");
                requestDispatcher.forward(req, resp);
        }

    }

    private List<Product> findByName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("name");
        System.out.println("1");
        return iProductService.findByName(name);
    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = iProductService.findById(id);
        req.setAttribute("product", product);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/edit.jsp");
        requestDispatcher.forward(req, resp);
        resp.sendRedirect("/product-servlet");
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("idDelete"));
        iProductService.deleteProduct(id);
        resp.sendRedirect("/product-servlet");
    }

    private void addNewProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String date = req.getParameter("date");
        Product product=new Product(id, name, price, date);
        iProductService.addNewProduct(product);
        resp.sendRedirect("/product-servlet");
    }
}