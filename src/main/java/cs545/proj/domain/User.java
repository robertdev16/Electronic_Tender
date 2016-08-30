package cs545.proj.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.Valid;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;


@Entity
public class User implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = -4521979847259295479L;

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
    
    @NotBlank
    private String username;
    
    @NotBlank
    @Length(min=6, message="Password should be more than 5 charactes")
    private String password;
    
    @Enumerated(EnumType.STRING)
	@ElementCollection
	private Set<UserRole> roleSet = new HashSet<UserRole>();
    
    @NotBlank
    private String firstName;
    
    @NotBlank
    private String lastName;

    @NotBlank
    @Email
    private String email;
    
    @Valid
    @OneToOne(cascade=CascadeType.ALL)
    private Phone phone;

    @Valid
    @OneToOne(cascade=CascadeType.ALL)
    private Address address;

	public Set<UserRole> getRoleSet() {
		return roleSet;
	}

	public void setRoleSet(Set<UserRole> roleSet) {
		this.roleSet = roleSet;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Phone getPhone() {
		return phone;
	}

	public void setPhone(Phone phone) {
		this.phone = phone;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

}
