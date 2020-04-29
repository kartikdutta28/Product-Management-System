package com.example.demo.config;

import com.example.demo.dao.UsersRepository;
import com.example.demo.dao.UsersRepository;
import com.example.demo.model.Users;
import com.example.demo.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.demo.model.OrderdProducts;
import com.example.demo.model.Orders;
import com.example.demo.model.Product;
import com.example.demo.service.OrderService;
import com.example.demo.service.ProductService;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.PostConstruct;

@Component
public class Startup {
    @Autowired
    private ProductService ps;

    @Autowired
    private OrderService os;

    @Autowired
    private UsersRepository ur;
    @PostConstruct
    public void init(){
       ur.save(new Users(1,"john","john@gmail.com","123","ROLE_USER",true));
        ur.save(new Users(2,"fred","fred@gmail.com","123","ROLE_ADMIN",true));
       ps.save(new Product(new Long(1), "Blue Denims", 2500.0,6,"Clothing"));
       ps.save(new Product(new Long(2), "White Shirt", 2700.0,12,"Clothing"));
       ps.save(new Product(new Long(3), "Kurta", 1200.0,4,"Clothing"));
       ps.save(new Product(new Long(4), "Hat", 500.0,18,"Accessories"));
       ps.save(new Product(new Long(5), "Printed T-Shirts", 2500.0,5,"Clothing"));
       ps.save(new Product(new Long(6), "Disney T-Shirts", 1700.0,5,"Merchandise"));
       ps.save(new Product(new Long(7), "Marvel Hoodies", 3000.0,5,"Merchandise"));
       ps.save(new Product(new Long(8), "Watch", 1500.0,4,"Accessories"));
       Set<OrderdProducts>set=new HashSet<OrderdProducts>();
       set.add(new OrderdProducts(1, "Blue Denims",2500.0,"Clothing" ,2));
       set.add(new OrderdProducts(2, "White Shirt",2700.0 ,"Clothing",2));
       set.add(new OrderdProducts(3, "Kurta",1200.0 ,"Clothing",1));
       set.add(new OrderdProducts(4, "Hat",500.0 ,"Accessories",2));
       Orders orders=new Orders(2, new Date(),6900.0,"U",set);
       os.save(orders);
       Set<OrderdProducts>set2=new HashSet<OrderdProducts>();
       set2.add(new OrderdProducts(1, "Blue Denims",2500.0 ,"Clothing",4));
       set2.add(new OrderdProducts(2, "White Shirt",2700.0 ,"Clothing",5));
       set2.add(new OrderdProducts(6, "Disney T-Shirts",1700.0 ,"Merchandise",2));
       set2.add(new OrderdProducts(3, "Kurta",1200.0 ,"Clothing",2));
       Orders orders2=new Orders(2, new Date(),6400.0,"U",set2);
       os.save(orders2);
       Set<OrderdProducts>set3=new HashSet<OrderdProducts>();
       set3.add(new OrderdProducts(1, "Blue Denims",2500.0 ,"Clothing",1));
       set3.add(new OrderdProducts(2, "White Shirt",2700.0 ,"Clothing",1));
       set3.add(new OrderdProducts(3, "Kurta",1200.0 ,"Clothing",1));
       Orders orders3=new Orders(3, new Date(),6400.0,"U",set3);
       os.save(orders3);
       Set<OrderdProducts>set4=new HashSet<OrderdProducts>();
       set4.add(new OrderdProducts(1, "Blue Denims",2500.0 ,"Clothing",1));
       set4.add(new OrderdProducts(2, "White Shirt",2700.0 ,"Clothing",2));
       set4.add(new OrderdProducts(3, "Kurta",1200.0 ,"Clothing",2));
       Orders orders4=new Orders(3, new Date(),6400.0,"U",set4);
       os.save(orders4);
    }
}
