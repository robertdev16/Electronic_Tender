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

import cs545.proj.domain.Member;
import cs545.proj.service.MemberService;


@Controller
@RequestMapping({"/member"})
public class MemberController {
	
	@Autowired
	private MemberService  memberService;

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String listMembers(Model model) {
		model.addAttribute("members", memberService.listAllMembers());
		return "memberList";
	}
	
  	@RequestMapping(value = "/detail/{memberId}", method = RequestMethod.GET)
	public String getMemberById(@PathVariable("memberId") int memberId, Model model) {
		model.addAttribute("member", memberService.getMemberById(memberId));
 		return "memberDetail";
	}

	@RequestMapping(value = "/edit/{memberId}",  method = RequestMethod.GET)
	public String getEditMemberForm(@PathVariable("memberId") int memberId, Model model) {
		model.addAttribute("member", memberService.getMemberById(memberId));
		return "editMember";
	}
	
	@RequestMapping(value="/update" ,method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute("newMember") @Valid Member memberToBeEdited, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()) {
			return "editMember";
		}
		memberService.saveOrUpdate(memberToBeEdited);
	   	return "redirect:/memberDetail";
	}
	
//	@RequestMapping(value = "/add", method = RequestMethod.GET)
//  	@PreAuthorize("hasRole('ROLE_ADMIN')")    // If global-method-security enabled in Dispatcher config
//	public String getAddNewMemberForm(@ModelAttribute("newMember") Member newMember) {
//	   return "addMember";
//	}
//	   
//	@RequestMapping(value = "/add", method = RequestMethod.POST)
//	public String processAddNewMemberForm(@ModelAttribute("newMember") @Valid Member memberToBeAdded, BindingResult result, HttpServletRequest request) {
//		if(result.hasErrors()) {
//			return "addMember";
//		}
//
//			 //  Error caught by ControllerAdvice IF no authorization...
//			memberService.saveOrUpdate(memberToBeAdded);
//	   	return "redirect:/memberList";
// 
//	}
	
 
}
