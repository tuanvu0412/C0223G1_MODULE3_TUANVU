package com.example.ss11_mvc.repository;

import com.example.ss11_mvc.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> list = new ArrayList<>();

    static {
        list.add(new Product(1, "laptop", 10000, "12-12-2020"));
        list.add(new Product(2, "pc", 20000, "12-12-2020"));
        list.add(new Product(3, "phone", 5000, "12-12-2020"));
        list.add(new Product(4, "headphone", 3000, "12-12-2020"));
    }

    @Override
    public List<Product> displayList() {
        return list;
    }

    @Override
    public void addNewProduct(Product product) {
        list.add(product);
    }

    @Override
    public void deleteProduct(int id) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId() == id) {
                list.remove(list.get(i));
                break;
            }
        }
    }

    @Override
    public void editProduct(int id, Product product) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId() == product.getId()) {
                list.set(i, product);
                break;
            }
        }
    }

    @Override
    public Product findById(int id) {
        for (Product p : list) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product>list1=new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            if(list.get(i).getName().equals(name)) {
                list1.add(list.get(i));
            }
        }
        System.out.println("bc");
        return list1;
    }
}
