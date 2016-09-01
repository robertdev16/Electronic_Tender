package cs545.proj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value="/loginPage", method = RequestMethod.GET)
	public String login() {
 		return "loginPageTile";
	}
 
	@RequestMapping(value="/loginFailed", method = RequestMethod.GET)
	public String loginerror(Model model) {
		model.addAttribute("error", "true");
		return "loginPageTile";
	}
 
	@RequestMapping(value="/logoutSuccess", method = RequestMethod.GET)
	public String logout(Model model) {
 		return "redirect:/home";
 	}
}
