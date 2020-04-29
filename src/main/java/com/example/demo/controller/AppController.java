package com.example.demo.controller;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.example.demo.dao.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.dao.ProductRepository;
import com.example.demo.dao.UsersRepository;
import com.example.demo.model.Product;
import com.example.demo.model.Users;

@Controller
public class AppController {
	
	@Autowired
	UsersRepository ur;
	
	@Autowired
	ProductRepository pr;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mv=new ModelAndView("user/home");
		List<Product> pList=(List<Product>) pr.findAll();
		mv.addObject("pList",pList);
		return mv;
	}

	@GetMapping("/all")
	public List<Product>all(){
		return (List<Product>) pr.findAll();
	}

	
	@RequestMapping("/demo")
	public ModelAndView demoForm() {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("demoForm");
		Product product=new Product();
		modelAndView.addObject("product", product);
		return modelAndView;
	}
}
