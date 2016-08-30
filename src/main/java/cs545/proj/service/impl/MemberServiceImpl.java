package cs545.proj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cs545.proj.domain.Member;
import cs545.proj.repository.MemberRepository;
import cs545.proj.service.MemberService;

@Service
@Transactional 
public class MemberServiceImpl implements cs545.proj.service.MemberService {
	
 	@Autowired
	private MemberRepository memberRepository;


  	@PreAuthorize("hasRole('ROLE_ADMIN')")
  	public void save( Member member) {  		
  		memberRepository.save(member);
 	}
  	
  	
	public List<Member> findAll() {
		return (List< Member>)memberRepository.findAll();
	}

	public Member findByMemberNumber(int memberId) {
		return null;
	}


	@Override
	public void saveFull(Member member) {
		// TODO Auto-generated method stub
		
	}
 

}
