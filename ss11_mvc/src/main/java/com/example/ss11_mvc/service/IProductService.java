package com.example.ss11_mvc.service;

import com.example.ss11_mvc.model.Product;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IProductService {
    List<Product> displayList();

    void addNewProduct(Product product);

    void deleteProduct(int id);

    void editProduct(Product product);

    Product findById(int id);
}
