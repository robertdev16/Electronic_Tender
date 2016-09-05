package cs545.proj.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
import javax.validation.Valid;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;


@Entity
public class User implements Serializable {

	private static final long serialVersionUID = -4521979847259295479L;

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
    
    @NotBlank
    @Email
    @Column(unique = true)
    private String username;
    
    @Min(6)
    @Transient
    private String password;
    
    @Min(6)
    @Transient
    private String confirmPassword;
    
    @Enumerated(EnumType.STRING)
	@ElementCollection
	private Set<UserRole> roleSet = new HashSet<UserRole>();
    
    @NotBlank
    private String firstName;
    
    @NotBlank
    private String lastName;

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

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
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
