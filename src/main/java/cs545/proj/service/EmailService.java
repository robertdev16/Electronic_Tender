package cs545.proj.service;

import java.util.Set;

import cs545.proj.domain.Tender;
 
public interface EmailService {

	public Set<String> getAllEmailsNeedInformedByTender(Tender tender);
	
	public int informMembersByEmail(Set<String> emailSet);

}
