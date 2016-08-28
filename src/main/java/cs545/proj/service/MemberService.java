package cs545.proj.service;

import java.util.List;

import cs545.proj.domain.Member;
 
public interface MemberService {

	public void save(Member member);
	public List<Member> findAll();
	public Member findByMemberNumber(int memberId);
  	public void saveFull( Member member);  		
}
