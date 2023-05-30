package com.example.ss10_jstl.repository;

import com.example.ss10_jstl.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static List<Customer>list=new ArrayList<>();
    static {
        list.add(new Customer(1,"Mai Văn Hoàn","1983-08-12","Hà Nội"));
        list.add(new Customer(2,"Nguyễn Văn Nam","1983-08-13","Hà Nội"));
        list.add(new Customer(3,"Nguyễn Thái Hòa","1983-08-14","Hà Nội"));
        list.add(new Customer(4,"Trần Đăng Khoa","1983-08-15","Hà Nội"));
        list.add(new Customer(5,"Nguyễn Đình Thi","1983-08-16","Hà Nội"));
    }

    @Override
    public List<Customer> display() {
        return list;
    }
}
