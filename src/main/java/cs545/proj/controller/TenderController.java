package cs545.proj.controller;
	import javax.servlet.http.HttpServletRequest;
	import javax.validation.Valid;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.security.access.prepost.PreAuthorize;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.validation.BindingResult;
	import org.springframework.web.bind.annotation.ModelAttribute;
	import org.springframework.web.bind.annotation.PathVariable;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
	import org.springframework.web.bind.annotation.RequestParam;

import cs545.proj.domain.Tender;
import cs545.proj.service.TenderService;
	@Controller
	@RequestMapping({"/tenders"})
	public class TenderController {
		
		@Autowired
		private TenderService  tenderService;

		@RequestMapping
		public String listTenders(Model model) {
			model.addAttribute("tenders",tenderService.listAllTenders());
			return "tenderList";
		}
		
	  	@RequestMapping("/{catagoryId}")
		public String getTenderById(@PathVariable("catagoryId") int catagoryId,Model model) {
	  		Tender tender = tenderService.getTenderById(catagoryId);
			model.addAttribute("tender", tender);

	 		return "welcome";
		}
	  	
	  	@RequestMapping("/tender")
		public String getTenderById2(@RequestParam("id") int id,Model model) {
	  		Tender tender = tenderService.getTenderById(id);
			model.addAttribute("tender", tender);

	 		return "welcome";
		}
	  	

		@RequestMapping(value = "/add", method = RequestMethod.GET)
	  	@PreAuthorize("hasRole('ROLE_ADMIN')")    // If global-method-security enabled in Dispatcher config
		public String getAddNewTenderForm(@ModelAttribute("newTender") Tender newTender) {
		   return "addTender";
		}
		   
		@RequestMapping(value = "/add", method = RequestMethod.POST)
		public String processAddNewTenderForm(@ModelAttribute("newTender") @Valid Tender tenderToBeAdded, BindingResult result, HttpServletRequest request) {
			if(result.hasErrors()) {
				return "addTender";
			}

				 //  Error caught by ControllerAdvice IF no authorization...
			tenderService.saveOrUpdate(tenderToBeAdded);

		   	return "redirect:/tenders";
	 
		}
		
	 
	}
