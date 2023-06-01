package com.example.ss11_mvc.repository;

import com.example.ss11_mvc.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> displayList();

    void addNewProduct(Product product);

    void deleteProduct(int id);

    void editProduct(int id, Product product);
    Product findById(int id);

    List<Product> findByName(String name);
}
