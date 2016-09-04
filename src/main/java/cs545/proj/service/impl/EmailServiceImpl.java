package cs545.proj.service.impl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import cs545.proj.domain.Category;
import cs545.proj.domain.Member;
import cs545.proj.domain.Tender;
import cs545.proj.service.EmailService;

@Service
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
	@Async
	public void informMembersByEmail(Tender tender) {

		String[] memberEmails = getAllEmailsNeedInformedByTender(tender).toArray(new String[0]);
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setFrom("Electronic Tender <springfuns2016@gmail.com>");
		smm.setTo("springfuns2016@gmail.com");
		smm.setBcc(memberEmails);
		smm.setSubject("New [Electronic Tender] " + tender.getTitle());
		smm.setText("Dear Electronic Tender Member, there is a new tender posted with the following summary.\n"
				+ "Welcome to visit our site for detail information. Thank you!\n"
				+ "\nTiTle:\n" + tender.getTitle()
				+ "\n\nPosted: " + tender.getPostDate()
				+ "\nDeadline: " + tender.getDeadline()
				+ "\n\nDescription:\n" + tender.getDescription());
		
		mailSender.send(smm);
	}

}
