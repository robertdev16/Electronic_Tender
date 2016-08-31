package cs545.proj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cs545.proj.service.CategoryService;
import cs545.proj.service.TenderService;
  
@Controller
public class NavigationController {
	
	@Autowired
    private CategoryService categoryService;
	
	@Autowired
    private TenderService tenderService;

	@RequestMapping({"/","/home"})
	public String welcome(Model model) {
		model.addAttribute("categories", categoryService.listAllCategories());
		model.addAttribute("latest5Tenders", tenderService.findFiveLatestTender());
		return "homeTile";
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
