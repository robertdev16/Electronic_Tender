package cs545.proj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cs545.proj.domain.Category;
import cs545.proj.domain.Tender;
import cs545.proj.service.CategoryService;
import cs545.proj.service.TenderService;

@Controller
@RequestMapping({ "/tender" })
public class TenderController {

	@Autowired
	private TenderService tenderService;

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String listTenders(Model model) {
		model.addAttribute("tenders", tenderService.listAllTenders());
		return "tenderListTile";
	}

	@RequestMapping(value = "/byCategory/{categoryId}", method = RequestMethod.GET)
	public String getTendersByCategoryId(@PathVariable("categoryId") int categoryId, Model model) {
		Category category = categoryService.getCategoryById(categoryId);
		model.addAttribute("tenders", (category == null) ? null : category.getTenderList());
		return "tenderListTile";
	}

	@RequestMapping("/detail/{tenderId}")
	public String getTenderById(@PathVariable("tenderId") int tenderId, Model model) {
		model.addAttribute("tender", tenderService.getTenderById(tenderId));
		return "tenderTile";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String getAddNewTenderForm(@ModelAttribute("newTender") Tender newTender) {
		return "postTenderTile";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String processAddNewTenderForm(@ModelAttribute("newTender") @Valid Tender tenderToBeAdded,
			BindingResult result, HttpServletRequest request) {
		if (result.hasErrors()) {
			return "postTenderTile";
		}

		// Error caught by ControllerAdvice IF no authorization...
		tenderService.saveOrUpdate(tenderToBeAdded);

		return "redirect:/tenders";

	}

}
