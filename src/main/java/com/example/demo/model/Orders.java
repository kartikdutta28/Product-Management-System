package com.example.demo.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.*;

@Entity
public class Orders {
	@Id
	@Column(name="Order_Id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int customerId;
	private Date date;
	private Double amount;
	private String status;
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="Order_Id")
	Set<OrderdProducts> orderdProducts;
	
	
	public Orders(int customerId, Date date, Double amount, String status, Set<OrderdProducts> orderdProducts) {
		super();
		this.customerId = customerId;
		this.date = date;
		this.amount = amount;
		this.status = status;
		this.orderdProducts = orderdProducts;
	}
	

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getCustomerId() {
		return customerId;
	}


	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public Double getAmount() {
		return amount;
	}


	public void setAmount(Double amount) {
		this.amount = amount;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Set<OrderdProducts> getOrderdProducts() {
		return orderdProducts;
	}


	public void setOrderdProducts(Set<OrderdProducts> orderdProducts) {
		this.orderdProducts = orderdProducts;
	}


	public Orders() {
	}
}
