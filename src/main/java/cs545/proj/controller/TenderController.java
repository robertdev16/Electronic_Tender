package cs545.proj.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cs545.proj.domain.Category;
import cs545.proj.domain.Tender;
import cs545.proj.domain.User;
import cs545.proj.service.CategoryService;
import cs545.proj.service.EmailService;
import cs545.proj.service.EmployeeService;
import cs545.proj.service.MemberService;
import cs545.proj.service.TenderService;

@Controller
@RequestMapping("/tender")
public class TenderController {

	@Autowired
	private TenderService tenderService;

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private EmployeeService employeeService;

	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

	private static String attachmentPath = "/resources/attached/";

	@ModelAttribute
	public void prepareCategories(Model model) {
		model.addAttribute("categories", categoryService.listAllCategories());
		
		Map<Integer, String> categoryMap = new LinkedHashMap<Integer, String>();
		for (Category category : categoryService.listAllCategories()) {
			categoryMap.put(category.getId(), category.getName());
		}
		model.addAttribute("categoryMap", categoryMap);
	}

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String listTenders(Model model) {
		model.addAttribute("tenders", tenderService.listAllTenders());
		return "tenderListTile";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchTenderTitle(@RequestParam("keyword") String keyword, Model model) {
		String trimKey = keyword.trim();
		if (trimKey.isEmpty())
			return "redirect:/tender/all";
		
		model.addAttribute("tenders", tenderService.searchTenderByTitle(trimKey));
		model.addAttribute("lastSearchKeyword", trimKey);
		return "tenderListTile";
	}
	
	@RequestMapping(value = "/byCategory/{categoryId}", method = RequestMethod.GET)
	public String getTendersByCategoryId(@PathVariable("categoryId") int categoryId, Model model) {
		Category category = categoryService.getCategoryById(categoryId);
		model.addAttribute("tenders", (category == null) ? null : category.getTenderList());
		model.addAttribute("selectedCategoryId", categoryId);
		return "tenderListTile";
	}

	@RequestMapping(value = "/detail/{tenderId}", method = RequestMethod.GET)
	public String getTenderById(@PathVariable("tenderId") int tenderId, Model model) {
		model.addAttribute("tender", tenderService.getTenderById(tenderId));
		model.addAttribute("attachmentPath", attachmentPath);
		return "tenderTile";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String getAddNewTenderForm(@ModelAttribute("newTender") Tender newTender, Model model) {
		
		return "postTenderTile";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String processAddNewTenderForm(@Valid @ModelAttribute("newTender") Tender newTender, BindingResult result,
			HttpSession session, RedirectAttributes redirect, Principal principal) throws IllegalStateException, IOException {

		if (result.hasErrors()) {
			return "postTenderTile";
		}
		
		Date nowTime = new Date();
		newTender.setPostDate(nowTime);
		String dateTimeStr = sdf.format(nowTime);
		newTender.setRefId("SFET-" + dateTimeStr);
		MultipartFile attachmentFile = newTender.getTenderMultipart();
		if ((attachmentFile != null) && (!attachmentFile.isEmpty())) {
			String newFilename = dateTimeStr + attachmentFile.getOriginalFilename();
			String rootDirectory = session.getServletContext().getRealPath("/");
			attachmentFile.transferTo(new File(rootDirectory + attachmentPath + newFilename));
			newTender.setAttachmentFileName(newFilename);
		}

		Tender savedTender = tenderService.saveOrMerge(newTender);
		for (Integer categoryId : newTender.getCheckedCategoryIDs()) {
			savedTender.addCategory(categoryService.getCategoryById(categoryId));
		}
		if (principal != null) {
			User user;
			Authentication authentication = (Authentication) principal;
			Set<String> roleSet = new HashSet<String>();
			for (GrantedAuthority ga : authentication.getAuthorities()) {
				roleSet.add(ga.getAuthority());
			}
			if (roleSet.contains("ROLE_ORGANIZATION"))
				user = memberService.getMemberByUsername(authentication.getName()).getUser();
			else
				user = employeeService.getEmployeeByUsername(authentication.getName()).getUser();
			
			savedTender.setPublishUser(user);
		}

		savedTender = tenderService.saveOrMerge(savedTender);
		emailService.informMembersByEmail(savedTender);

		redirect.addFlashAttribute("successNew", true);
		return "redirect:/tender/detail/" + savedTender.getId();
	}

}
