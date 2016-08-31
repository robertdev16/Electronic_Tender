package cs545.proj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cs545.proj.domain.Tender;
import cs545.proj.domain.User;
import cs545.proj.repository.TenderRepository;
import cs545.proj.service.TenderService;

@Service
@Transactional
public class TenderServiceImpl implements TenderService {

	@Autowired
	private TenderRepository tenderRepository;

	@Override
	public List<Tender> listAllTenders() {
		return tenderRepository.findAll();
	}

	@Override
	public Tender getTenderById(int tenderId) {
		return tenderRepository.getOne(tenderId);
	}

	@Override
	public Tender saveOrUpdate(Tender tender) {
		return tenderRepository.saveAndFlush(tender);
	}

	@Override
	public List<Tender> findByPublishUser(User user) {
		return tenderRepository.findByPublishUser(user);
	}

	@Override
	public List<Tender> findByAgency(String agency) {
		return tenderRepository.findByAgency(agency);
	}

	@Override
	public List<Tender> findFiveLatestTender() {
		return tenderRepository.findFirst5ByOrderByPostDateDesc();
	}

	@Override
	public List<Tender> searchTenderByTitle(String keyword) {
		return tenderRepository.findByTitleLike("%" + keyword + "%");
	}

}
