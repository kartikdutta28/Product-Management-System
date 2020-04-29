package com.example.demo.controller;

import java.util.List;
import java.util.Optional;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.model.Orders;
import com.example.demo.model.Product;
import com.example.demo.service.OrderService;
import com.example.demo.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService ps;
	
	@Autowired
	OrderService os;
	
	@PostMapping("/addProduct")
	public String addProduct(@ModelAttribute("product") @Valid Product product,BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "demoForm";
		}
		ps.save(product);
		return "redirect:adminHome";
	}
	@RequestMapping("/adminHome")
	public ModelAndView adminHome() {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("adminHome");
		List<Product>pList=(List<Product>) ps.get();
		List<Orders> oList=os.getAll();
		modelAndView.addObject("pList",pList);
		modelAndView.addObject("oList", oList);
		return modelAndView;
	}
	@RequestMapping("/userHome")
	public ModelAndView userHome() {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("userHome");
		List<Product>pList=(List<Product>) ps.get();
		modelAndView.addObject("pList",pList);
		return modelAndView;
	}
	@RequestMapping("/tempUserHome")
	public ModelAndView tempuserHome() {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("tempUserHome");
		List<Product>pList=(List<Product>) ps.get();
		modelAndView.addObject("pList",pList);
		return modelAndView;
	}
	@GetMapping("/deleteProduct")
	public String deleteProduct(@RequestParam("id")Long id) {
		ps.delete(id);
		return "redirect:adminHome";
	}
	@GetMapping("/editProduct")
	public ModelAndView editProduct(@RequestParam("id")Long id) {
		ModelAndView modelAndView=new ModelAndView("editProductForm");
		Optional<Product> product=ps.findById(id);
		modelAndView.addObject("product",product);
		return modelAndView;
	}
	
	
}
