package cs545.proj.service;

import java.util.List;

import cs545.proj.domain.Tender;
import cs545.proj.domain.User;

public interface TenderService {

	public List<Tender> listAllTenders();
	
	public Tender getTenderById(int tenderId);

	public Tender saveOrUpdate(Tender tender);

	public List<Tender> findByPublishUser(User user);

	public List<Tender> findByAgency(String agency);

	public List<Tender> findFiveLatestTender();
	
	public List<Tender> searchTenderByTitle(String keyword);
}
