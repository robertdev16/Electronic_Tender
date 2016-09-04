package cs545.proj.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Account implements Serializable {

	private static final long serialVersionUID = -2168450739594354756L;

	@Id
	@Column(nullable = false, unique = true)
	String username;
	
	@Column(nullable = false)
	String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
