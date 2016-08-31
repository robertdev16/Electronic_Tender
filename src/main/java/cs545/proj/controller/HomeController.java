package cs545.proj.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cs545.proj.service.EmailService;
import cs545.proj.service.MemberService;
  
@Controller
public class HomeController {

  	@Autowired
 	private MemberService customerService;

	@RequestMapping({"/","/home"})
	public String welcome(Model model) {
		
		model.addAttribute("greeting", "Welcome to Home");
		return "home";
	}
	
	@RequestMapping("/tenders")
	public String tenders(Model model) {
		
		model.addAttribute("greeting", "Welcome to Tender List");
		return "home";
	}
	
	@RequestMapping({"/subscribe"})
	public String subscribe(Model model) {
		model.addAttribute("greeting", "Welcome to Subscribe");
		return "home";
	}
	
	@RequestMapping({"/contact"})
	public String contact(Model model) {
		
		model.addAttribute("greeting", "Welcome to Contact Us Page");
		return "home";
	}
 
}
