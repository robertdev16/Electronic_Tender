package cs545.proj.service.impl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cs545.proj.domain.Category;
import cs545.proj.domain.Member;
import cs545.proj.domain.Tender;
import cs545.proj.service.EmailService;

@Service
@Transactional
public class EmailServiceImpl implements EmailService {

	@Autowired
	private MailSender mailSender;
	
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
	public int informMembersByEmail(Set<String> emailSet, String title) {

		String[] memberEmails = emailSet.toArray(new String[0]);
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setFrom("Electronic Tender <springfuns2016@gmail.com>");
		smm.setTo("springfuns2016@gmail.com");
		smm.setBcc(memberEmails);
		smm.setSubject("New [Electronic Tender] " + title);
		smm.setText("Dear Electronic Tender Member, there is a new tender posted with the following TITLE:\n\n"
				+ title + "\n\nWelcome to login our site and check it at your convenience. Thank you!");
		
		mailSender.send(smm);
		
		return memberEmails.length;
	}

	@Override
	public int informMembersByTender(Tender tender) {
		return informMembersByEmail(getAllEmailsNeedInformedByTender(tender), tender.getTitle());
	}

}
