package cs545.proj.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cs545.proj.domain.Member;
import cs545.proj.service.MemberService;

@Controller
@RequestMapping({ "/member" })
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String listMembers(Model model) {
		model.addAttribute("members", memberService.listAllMembers());
		return "memberListTile";
	}

	@RequestMapping(value = "/detail/{username}", method = RequestMethod.GET)
	public String getMemberById(@PathVariable("username") String username, Model model) {
		model.addAttribute("member", memberService.getMemberByUsername(username));
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
	
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String saveNewMember(@Valid @ModelAttribute("newMember") Member newMember, BindingResult result) {
		
		if (result.hasErrors()) {
			return "registerTile";
		}
		Member savedMember = memberService.saveOrMerge(newMember);
		return "redirect:/member/detail/" + savedMember.getUser().getUsername();
	}

}
