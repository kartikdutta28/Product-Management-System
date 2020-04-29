package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dao.OrdersRepository;
import com.example.demo.model.Orders;

@Service
public class OrderService {
		@Autowired
		OrdersRepository or;
		
		public void save(Orders order) {
			or.save(order);
		}
		public List<Orders> getAll(){
			return (List<Orders>) or.findAll();
		}
		public void deleteOrder(int id) {
			or.deleteById(id);
		}
		public List<Orders> findByCustId(int id){
			return (List<Orders>) or.findByCustomerId(id);
		}
		public Orders findById(int id) {
			return or.findById(id);
		}
		public void delete(Orders orders) {
			or.delete(orders);
		}
		public List<Orders>findByStatus(String s){
			return or.findApprovedOrders(s);
		}
		
}
