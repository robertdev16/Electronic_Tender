package cs545.proj.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cs545.proj.domain.Category;
import cs545.proj.domain.Member;
import cs545.proj.domain.UserRole;
import cs545.proj.service.CategoryService;
import cs545.proj.service.MemberService;
import cs545.proj.validator.MemberRegisterValidator;

@Controller
@RequestMapping({ "/member" })
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private MemberRegisterValidator memberRegisterValidator;
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

	private static String licensePath = "/resources/license/";
	
	@ModelAttribute
	public void prepareCategories(Model model) {
		Map<Integer, String> categoryMap = new LinkedHashMap<Integer, String>();
		for (Category category : categoryService.listAllCategories()) {
			categoryMap.put(category.getId(), category.getName());
		}
		model.addAttribute("categoryMap", categoryMap);
	}

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String listMembers(Model model) {
		model.addAttribute("members", memberService.listAllMembers());
		return "memberListTile";
	}

	@RequestMapping(value = "/detailId/{memberId}", method = RequestMethod.GET)
	public String getMemberById(@PathVariable("memberId") int memberId, Model model) {
		model.addAttribute("member", memberService.getMemberById(memberId));
		model.addAttribute("licensePath", licensePath);
		return "memberDetailTile";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getMemberByUsername(Model model, Principal principal) {
		if (principal == null)
			return "redirect:/loginPage";
		
		Authentication authentication = (Authentication) principal;
		model.addAttribute("member", memberService.getMemberByUsername(authentication.getName()));
		model.addAttribute("licensePath", licensePath);
		return "memberDetailTile";
	}

	@RequestMapping(value = "/edit/{memberId}", method = RequestMethod.GET)
	public String getEditMemberForm(@PathVariable("memberId") int memberId, Model model) {
		model.addAttribute("newMember", memberService.getMemberById(memberId));
		return "editMemberTile";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute("newMember") @Valid Member memberToBeEdited, BindingResult result) {
		if (result.hasErrors()) {
			return "editMemberTile";
		}
		memberService.saveOrMerge(memberToBeEdited);
		return "redirect:/memberListTile";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegisterMemberForm(@ModelAttribute("newMember") Member newMember) {
		return "registerTile";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String saveNewMember(@Valid @ModelAttribute("newMember") Member newMember, BindingResult result,
			RedirectAttributes redirect) {
		
		memberRegisterValidator.validate(newMember, result);
		if (result.hasErrors()) {
			return "registerTile";
		}
		
		newMember.getUser().setEmail(newMember.getUser().getUsername());
		newMember.getUser().getRoleSet().add(UserRole.ROLE_MEMBER);

		Member savedMember = memberService.saveOrMerge(newMember);
		for (Integer categoryId : newMember.getCheckedCategoryIDs()) {
			savedMember.addCategory(categoryService.getCategoryById(categoryId));
		}
		savedMember = memberService.saveOrMerge(savedMember);
		memberService.saveMemberAccount(savedMember);

		redirect.addFlashAttribute("successNew", true);
		return "redirect:/loginPage";
	}

}
