package com.example.ss10_jstl.service;

import com.example.ss10_jstl.model.Customer;
import com.example.ss10_jstl.repository.CustomerRepository;
import com.example.ss10_jstl.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository iCustomerRepository= new CustomerRepository();

    @Override
    public List<Customer> display() {
        return iCustomerRepository.display();
    }
}
