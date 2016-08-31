package cs545.proj.service;

import java.util.List;

import cs545.proj.domain.Member;
 
public interface MemberService {

	public Member getMemberByUsername(String username);
	
	public List<Member> listAllVerificationRequestMembers();
	
	public Member saveOrUpdate(Member member);
}
