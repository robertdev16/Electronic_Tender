package cs545.proj.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import cs545.proj.domain.Tender;
import cs545.proj.domain.User;


@Repository
public interface TenderRepository extends JpaRepository<Tender, Integer> {

	@Query("SELECT t FROM Tender t WHERE t.deadline >= :today ORDER BY t.postDate DESC")
	public List<Tender> listAllUnexpiredTendersByPostDateDesc(@Param("today") Date today);
	
	public List<Tender> findByPublishUserOrderByPostDateDesc(User user);
	
	public List<Tender> findByAgencyOrderByPostDateDesc(String agency);

	public List<Tender> findFirst5ByOrderByPostDateDesc();
	
	public List<Tender> findByTitleLikeOrderByPostDateDesc(String keyword);
}
