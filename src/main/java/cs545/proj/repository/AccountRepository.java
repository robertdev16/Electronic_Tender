package cs545.proj.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cs545.proj.domain.Account;


@Repository
public interface AccountRepository extends JpaRepository<Account, String> {

}
