package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.example.demo.model.Orders;

@Repository
public interface OrdersRepository extends CrudRepository<Orders,Integer>{
	List<Orders> findByCustomerId(int id);
	Orders findById(int id);
	@Query("FROM Orders o where o.status = :s")
	List<Orders>findApprovedOrders(@Param("s")String s);
}
