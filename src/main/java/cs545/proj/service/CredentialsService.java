package cs545.proj.service;

import java.util.List;

import cs545.proj.domain.Credentials;
import cs545.proj.domain.Member;
 
public interface CredentialsService {

	public void save(Credentials credentials);
	public List<Credentials> findAll();
 }
