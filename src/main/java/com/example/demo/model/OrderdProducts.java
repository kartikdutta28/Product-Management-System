package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class OrderdProducts {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;
	int pid;
	String name;
	Double price;
	String category;
	int quantity;
	public OrderdProducts() {
		// TODO Auto-generated constructor stub
	}
	public OrderdProducts(int pid, String name, Double price,String category,int quantity) {
		super();
		this.pid = pid;
		this.name = name;
		this.price = price;
		this.category=category;
		this.quantity=quantity;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

		
}
