package cs545.proj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import cs545.proj.domain.Member;


@Repository
public interface MemberRepository extends JpaRepository<Member, Integer> {

	public List<Member> findByUser_Username(String username);

	@Query("SELECT m FROM Member m WHERE LENGTH(m.licenseFileName) > 0 AND 'ROLE_ORGANIZATION' NOT MEMBER OF m.user.roleSet")
	public List<Member> listVerificationRequestMembers();

}
