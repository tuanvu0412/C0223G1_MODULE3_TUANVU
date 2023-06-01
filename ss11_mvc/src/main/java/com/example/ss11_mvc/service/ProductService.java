package com.example.ss11_mvc.service;

import com.example.ss11_mvc.model.Product;
import com.example.ss11_mvc.repository.IProductRepository;
import com.example.ss11_mvc.repository.ProductRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> displayList() {
        return productRepository.displayList();
    }

    @Override
    public void addNewProduct(Product product) {
        productRepository.addNewProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.deleteProduct(id);
    }

    @Override
    public void editProduct(Product product) {
        productRepository.editProduct(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return productRepository.findByName(name);
    }


}
