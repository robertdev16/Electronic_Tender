package cs545.proj.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
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
import org.springframework.web.multipart.MultipartFile;
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
		model.addAttribute("requestMembers", memberService.listVerificationRequestMembers());
		return "memberListTile";
	}

	@RequestMapping(value = "/grant/{memberId}", method = RequestMethod.POST)
	public String grantMemberById(@PathVariable("memberId") int memberId, Model model) {
		Member member = memberService.getMemberById(memberId);
		member.getUser().getRoleSet().add(UserRole.ROLE_ORGANIZATION);
		Member savedMember = memberService.saveOrMerge(member);

		return "redirect:/member/detailId/" + savedMember.getId();
	}
	
	@RequestMapping(value = "/detailId/{memberId}", method = RequestMethod.GET)
	public String getMemberById(@PathVariable("memberId") int memberId, Model model) {
		Member member = memberService.getMemberById(memberId);
		if (member.getUser().getRoleSet().contains(UserRole.ROLE_ORGANIZATION))
			model.addAttribute("hasCertified", true);
		model.addAttribute("member", member);
		model.addAttribute("licensePath", licensePath);
		return "memberDetailTile";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getMemberByUsername(Model model, Principal principal) {
		if (principal == null)
			return "redirect:/loginPage";
		
		Authentication authentication = (Authentication) principal;
		Member member = memberService.getMemberByUsername(authentication.getName());
		if (member.getUser().getRoleSet().contains(UserRole.ROLE_ORGANIZATION))
			model.addAttribute("hasCertified", true);
		model.addAttribute("member", member);
		model.addAttribute("licensePath", licensePath);
		return "memberDetailTile";
	}

	@RequestMapping(value = "/selfedit", method = RequestMethod.GET)
	public String getSelfEditMemberForm(Model model, Principal principal) {
		if (principal == null)
			return "redirect:/loginPage";
		
		Authentication authentication = (Authentication) principal;
		Member member = memberService.getMemberByUsername(authentication.getName());
		for (Category category: member.getSelectedCategories()) {
			member.getCheckedCategoryIDs().add(category.getId());
		}
		member.getUser().setPassword("88888888");
		member.getUser().setConfirmPassword("88888888");
		
		model.addAttribute("editMember", member);
		return "editMemberTile";
	}
	
	@RequestMapping(value = "/edit/{memberId}", method = RequestMethod.GET)
	public String getEditMemberForm(@PathVariable("memberId") int memberId, Model model) {
		Member member = memberService.getMemberById(memberId);
		for (Category category: member.getSelectedCategories()) {
			member.getCheckedCategoryIDs().add(category.getId());
		}
		member.getUser().setPassword("88888888");
		member.getUser().setConfirmPassword("88888888");
		
		model.addAttribute("editMember", member);
		return "editMemberTile";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String memberUpdate(@Valid @ModelAttribute("editMember") Member editMember, BindingResult result) {
		if (result.hasErrors()) {
			return "editMemberTile";
		}

		Member savedMember = memberService.saveOrMerge(editMember);
		Set<Category> categorySet = new HashSet<Category>();
		for (Category category: savedMember.getSelectedCategories()) {
			categorySet.add(category);
		}
		for (Category category: categorySet) {
			savedMember.removeCategory(category);
		}
		List<Integer> checkedIDs = editMember.getCheckedCategoryIDs();
		if (checkedIDs != null) {
			for (Integer categoryId : checkedIDs) {
				savedMember.addCategory(categoryService.getCategoryById(categoryId));
			}
		}
		savedMember = memberService.saveOrMerge(savedMember);
		return "redirect:/member/all";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String memberUpdateWithLicense(@Valid @ModelAttribute("editMember") Member editMember,
			BindingResult result, HttpSession session) throws IllegalStateException, IOException {
		if (result.hasErrors()) {
			return "editMemberTile";
		}

		MultipartFile licenseFile = editMember.getLicenseMultipart();
		if ((licenseFile != null) && (!licenseFile.isEmpty())) {
			String newFilename = sdf.format(new Date()) + licenseFile.getOriginalFilename();
			String rootDirectory = session.getServletContext().getRealPath("/");
			licenseFile.transferTo(new File(rootDirectory + licensePath + newFilename));
			editMember.setLicenseFileName(newFilename);
		}
		
		Member savedMember = memberService.saveOrMerge(editMember);
		Set<Category> categorySet = new HashSet<Category>();
		for (Category category: savedMember.getSelectedCategories()) {
			categorySet.add(category);
		}
		for (Category category: categorySet) {
			savedMember.removeCategory(category);
		}
		List<Integer> checkedIDs = editMember.getCheckedCategoryIDs();
		if (checkedIDs != null) {
			for (Integer categoryId : checkedIDs) {
				savedMember.addCategory(categoryService.getCategoryById(categoryId));
			}
		}
		savedMember = memberService.saveOrMerge(savedMember);
		return "redirect:/member/detail";
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
