package cs545.proj.repository;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import cs545.proj.domain.Credentials;
import cs545.proj.domain.Member;

	@Repository
	public interface CredentialsRepository extends  CrudRepository<Credentials, String> 
	{
  	}

