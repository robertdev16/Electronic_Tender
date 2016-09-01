package cs545.proj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cs545.proj.domain.Member;
import cs545.proj.repository.MemberRepository;
import cs545.proj.service.MemberService;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
 	@Autowired
	private MemberRepository memberRepository;

	@Override
	public Member getMemberByUsername(String username) {
		List<Member> memberList = memberRepository.findByUser_Username(username);
		return (memberList.isEmpty() || memberList == null) ? null : memberList.get(0);
	}

	@Override
	public List<Member> listVerificationRequestMembers() {
		return memberRepository.listVerificationRequestMembers();
	}

	@Override
	public Member saveOrUpdate(Member member) {
		return memberRepository.saveAndFlush(member);
	}

	@Override
	public List<Member> listAllMembers() {
		return memberRepository.findAll();
	}

	@Override
	public Member getMemberById(int memberId) {
		return memberRepository.getOne(memberId);
	}

}
