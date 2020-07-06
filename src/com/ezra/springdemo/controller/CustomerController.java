package com.ezra.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezra.springdemo.dao.CustomerDAO;
import com.ezra.springdemo.entity.Customer;
import com.ezra.springdemo.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
//	need to inject our customer service
	@Autowired
	private CustomerService customerService;
	
	//need to inject the customer dao
//	@Autowired
//	private CustomerDAO customerDAO;
	
	@GetMapping("/list")
	public String listCustomer(Model theModel) {
		
		//get customers from the service
		List<Customer> theCustomers= customerService.getCustomers();
		//add the customers to the model
		theModel.addAttribute("customers", theCustomers);
		
		
		return "list-customers"; //list-customers.jsp
	}
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		Customer theCustomer =new Customer();
		theModel.addAttribute(theCustomer);
		return "customer-form";
	}
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer theCustomer) {
		
		//save the customer using our service
		customerService.saveCustomer(theCustomer);
		return "redirect:/customer/list";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int theId,
			Model theModel) {
		//get the customer from our service
		Customer theCustomer=customerService.getCustomer(theId);
		
		//set customer as amodel attribute to pre-populate the form
		theModel.addAttribute("customer",theCustomer);
		//send over to our form
		
		return "customer-form";
	}
	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") int theId) {
		 //delete the customer
		customerService.deleteCustomer(theId);
		return "redirect:/customer/list";
	}
	
	@GetMapping("/search")
	public String searchCustomers(@RequestParam("theSearchName") String theSearchName,
            Model theModel) {

	// search customers from the service
		List<Customer> theCustomers = customerService.searchCustomers(theSearchName);
		theModel.addAttribute("customers", theCustomers);
		return "list-customers";
	}
	
	@RequestMapping("index")
	public String index() {
		return "index";
	}
}
