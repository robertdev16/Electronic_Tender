package cs545.proj.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.Valid;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class Tender implements Serializable {

	private static final long serialVersionUID = -3532377236419382983L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@NotBlank
	private String refId;

	@NotBlank
	private String title;
	
	@ManyToOne
	private User publishUser;

	@ManyToMany(mappedBy = "tenderList")
	private List<Catagory> categoryList;
	
	@NotBlank
	private String description;

    @NotBlank
    @Email
    private String contactEmail;
    
    @NotBlank
    private String contactPerson;
    
    @Valid
    @OneToOne(cascade=CascadeType.ALL)
    private Phone phone;

    @Valid
    @OneToOne(cascade=CascadeType.ALL)
    private Address address;
	
    @Temporal(TemporalType.TIMESTAMP)
	private Date postDate;
    
    @DateTimeFormat(pattern = "MM-dd-yyyy")
    @Temporal(TemporalType.DATE)
	private Date deadline;

    @NotBlank
    private String agency;

	@Transient
    private MultipartFile tenderMultipart;
    
    @NotBlank
    private String attachmentFileName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRefId() {
		return refId;
	}

	public void setRefId(String refId) {
		this.refId = refId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public User getPublishUser() {
		return publishUser;
	}

	public void setPublishUser(User publishUser) {
		this.publishUser = publishUser;
	}

	public List<Catagory> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Catagory> categoryList) {
		this.categoryList = categoryList;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
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

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getAgency() {
		return agency;
	}

	public void setAgency(String agency) {
		this.agency = agency;
	}

	public MultipartFile getTenderMultipart() {
		return tenderMultipart;
	}

	public void setTenderMultipart(MultipartFile tenderMultipart) {
		this.tenderMultipart = tenderMultipart;
	}

	public String getAttachmentFileName() {
		return attachmentFileName;
	}

	public void setAttachmentFileName(String attachmentFileName) {
		this.attachmentFileName = attachmentFileName;
	}

}
