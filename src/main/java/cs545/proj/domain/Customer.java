package cs545.proj.domain;


import com.fasterxml.jackson.annotation.JsonIgnore;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import java.io.Serializable;

@Entity
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Customer implements Serializable{


    private static final long serialVersionUID = 5140900014886997914L;

    @Id
    @GeneratedValue
    private int customerId;

    @NotEmpty (message = "The customer name must not be null")
    @NotNull (message = "The customer name must not be null")
    private String customerName;

    @NotEmpty (message = "The customer email must not be null")
    @Pattern(regexp=".+@.+\\..+", message="Wrong email!")
    private String customerEmail;
    @Valid
    private Phone Phone;

    @NotEmpty (message = "The customer username must not be null")
    private String username;

    @NotEmpty (message = "The customer password must not be null")
    @Length(min=6, message="Password should be more than 5 charactes")
    private String password;

    private boolean enabled;
    @JsonIgnore
    private MultipartFile licenceDocument;

    @OneToOne
    @JoinColumn(name = "AddressId")
    @Valid
    private CustomerAddress customerAddress;

    public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public Phone getPhone() {
		return Phone;
	}

	public void setPhone(Phone phone) {
		Phone = phone;
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

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public MultipartFile getLicenceDocument() {
		return licenceDocument;
	}

	public void setLicenceDocument(MultipartFile licenceDocument) {
		this.licenceDocument = licenceDocument;
	}

	public CustomerAddress getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(CustomerAddress customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerOrganization() {
		return customerOrganization;
	}

	public void setCustomerOrganization(String customerOrganization) {
		this.customerOrganization = customerOrganization;
	}

	private String customerOrganization;

    
} // The End of Class;
