package com.example.demo.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.persistence.criteria.Order;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.example.demo.dao.UserRepository;
import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.model.OrderdProducts;
import com.example.demo.model.Orders;
import com.example.demo.service.OrderService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class OrderController {
	@Autowired
	OrderService os;
	@Autowired
	UserRepository ur;

	@RequestMapping("/viewOrders")
	public ModelAndView adminHome() {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("viewOrders");
		List<Orders> oList=os.getAll();
		modelAndView.addObject("oList", oList);
		return modelAndView;
	}
	@GetMapping("/deleteOrder")
	public String deletOrder(@RequestParam("id")int id) {
		os.deleteOrder(id);
		return "redirect:viewOrders";
	}
	@GetMapping("/approvrOrder")
	public String approveOrder(@RequestParam("id")int id) {
		Orders orders=os.findById(id);
		orders.setStatus("A");
		os.save(orders);
		return "redirect:viewOrders";
	}
	@GetMapping("/order")
	public ModelAndView showOrder(@RequestParam("id")int id,@RequestParam("uid")int uid){
		ModelAndView mv=new ModelAndView("order");
		Orders orders=os.findById(id);
		Optional<User> user=ur.findById(id);
		mv.addObject("order",orders);
		mv.addObject("user",user);
		return  mv;
	}
	@GetMapping("/disapprovrOrder")
	public String disapproveOrder(@RequestParam("id")int id) {
		Orders orders=os.findById(id);
		orders.setStatus("D");
		os.save(orders);
		return "redirect:viewOrders";
	}
	@GetMapping("/userOrders")
	public ModelAndView userOrders(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView("userOrders");
		HttpSession session=request.getSession(false);
		int id=(int) session.getAttribute("userId");
		List<Orders> oList=os.findByCustId(id);
		if(oList.size()==0) {
			session.setAttribute("msg", "Sorry no orderes to display!!");
			session.setAttribute("class","alert-danger");
		}
		mv.addObject("oList", oList);
		return mv;
	}
	@GetMapping("/cancelOrder")
	public String cancelOrders(@RequestParam("id")int id,HttpServletRequest request){
		Orders order=os.findById(id);
		Date date=order.getDate();
		HttpSession session=request.getSession(false);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date2=sdf.format(date);
		String date3=sdf.format(new Date());
		if(date2.compareTo(date3)==0){
			os.delete(order);
			session.setAttribute("msg-2", "Order Has been deleted!!");
			session.setAttribute("class-2","alert-danger");
		}else {
			System.out.println("Order can't be canceled");
		}
		return "redirect:userOrders";
	}
	
	@GetMapping("/report")
	public ModelAndView generateReport(HttpServletRequest request) {
		List<Orders> rList=os.findByStatus("A");
		ModelAndView mv=new ModelAndView("salesReport");
		mv.addObject("rList", rList);
		return mv;
	}
	@PostMapping("/temp/checkOut")
	public String checkouttemp(HttpServletRequest request){
		String[] list= request.getParameterValues("order");
		if(list==null){
			return "redirect:userHome";
		}
		Orders order=new Orders();
		HttpSession session=request.getSession(false);
		int id=(int) session.getAttribute("userId");
		order.setCustomerId(id);
		Set<OrderdProducts> set=new HashSet<OrderdProducts>();
		order.setDate(new Date());
		Double amount=0.0;
		for(String l:list) {
			String temp[]=l.split(",");
			OrderdProducts or=new OrderdProducts();
			or.setName(temp[0]);
			or.setPid(Integer.parseInt(temp[2]));
			or.setPrice(Double.parseDouble(temp[1]));
			or.setCategory(temp[3]);
			int qty=Integer.parseInt(request.getParameter(temp[2]));
			amount=amount+(Double.parseDouble(temp[1])*qty);
			or.setQuantity(qty);
			set.add(or);
		}
		order.setAmount(amount);
		order.setStatus("U");
		order.setOrderdProducts(set);
		os.save(order);
		session.setAttribute("order", order);
		return "orderBill";
	}
}
