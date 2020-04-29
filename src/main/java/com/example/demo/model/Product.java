package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.*;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotBlank(message="Name cannot be blank")
	@Size(min = 3, max = 30, message = "Name should me minimum 3 characters and max 30 ")
	private String name;

	@NotNull(message = "Product price should not be blank")
	@Min(0)
	private Double price;

	@NotNull(message = "Quantity must not be empty")
	@Min(value = 1,message = "Quantity must be greater than 0 and cannot be a negative value")
	@Max(50)
	private int quantity;

	private String category;

	public Product(Long id, String name, Double price, int quantity, String category) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.category=category;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public Product() {
	}
}
