package cs545.proj.service.impl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cs545.proj.domain.Category;
import cs545.proj.domain.Member;
import cs545.proj.domain.Tender;
import cs545.proj.service.EmailService;

@Service
@Transactional
public class EmailServiceImpl implements EmailService {

	@Override
	public Set<String> getAllEmailsNeedInformedByTender(Tender tender) {
		Set<String> emailSet = new HashSet<String>();
		for (Category category : tender.getCategoryList()) {
			for (Member member : category.getSubscribedMembers()) {
				emailSet.add(member.getUser().getEmail());
			}
		}
		
		return emailSet;
	}

	@Override
	public int informMembersByEmail(Set<String> emailSet) {
		// TODO Auto-generated method stub
		return 0;
	}

}
