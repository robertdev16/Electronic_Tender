package cs545.proj.service;

import java.util.List;

import cs545.proj.domain.Member;
 
public interface MemberService {
	
	public List<Member> listAllMembers();
	
	public Member getMemberById(int memberId);

	public Member getMemberByUsername(String username);
	
	public List<Member> listVerificationRequestMembers();
	
	public Member saveOrMerge(Member member);
	
	public void encodeMemberPassword(Member member);
}
