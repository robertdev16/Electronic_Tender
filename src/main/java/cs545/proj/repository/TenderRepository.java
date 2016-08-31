package cs545.proj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cs545.proj.domain.Tender;
import cs545.proj.domain.User;


@Repository
public interface TenderRepository extends JpaRepository<Tender, Integer> {

	public List<Tender> findByPublishUser(User user);
	
	public List<Tender> findByAgency(String agency);

	public List<Tender> findFirst5ByOrderByPostDateDesc();
	
	public List<Tender> findByTitleLike(String keyword);
}
