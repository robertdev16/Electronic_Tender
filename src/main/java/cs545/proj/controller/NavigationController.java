package cs545.proj.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cs545.proj.service.CategoryService;
import cs545.proj.service.TenderService;
  
@Controller
public class NavigationController {
	
	private static final Logger logger = LoggerFactory.getLogger(NavigationController.class);
	
	@Autowired
    private CategoryService categoryService;
	
	@Autowired
    private TenderService tenderService;

	@RequestMapping({"/","/home"})
	public String welcome(Model model, Principal principal) {
		model.addAttribute("categories", categoryService.listAllCategories());
		model.addAttribute("latest5Tenders", tenderService.findFiveLatestTender());

		if (principal == null)
			return "homeTile";
		else
			return "authHomeTile";
	}
	
	@RequestMapping({"/subscribe"})
	public String subscribe(Model model) {
		model.addAttribute("greeting", "Welcome to Subscribe");
		return "subscribeTile";
	}
	
	@RequestMapping({"/contact"})
	public String contact(Model model) {
		
		model.addAttribute("greeting", "Welcome to Contact Us Page");
		return "contactTile";
	}
 
}
