package cs545.proj.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
import javax.validation.Valid;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Member implements Serializable {

	private static final long serialVersionUID = 642352635709059620L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Valid
	@OneToOne(cascade = CascadeType.ALL)
	private User user;

	private String organizationName;

	@Transient
	private MultipartFile licenseMultipart;

	private String licenseFileName="";

	@ManyToMany(mappedBy = "subscribedMembers")
	private List<Category> selectedCategories = new ArrayList<Category>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public MultipartFile getLicenseMultipart() {
		return licenseMultipart;
	}

	public void setLicenseMultipart(MultipartFile licenseMultipart) {
		this.licenseMultipart = licenseMultipart;
	}

	public String getLicenseFileName() {
		return licenseFileName;
	}

	public void setLicenseFileName(String licenseFileName) {
		this.licenseFileName = licenseFileName;
	}

	public List<Category> getSelectedCategories() {
		return selectedCategories;
	}

	public void setSelectedCategories(List<Category> selectedCategories) {
		this.selectedCategories = selectedCategories;
	}
	
	public void addCategory(Category category) {
		this.selectedCategories.add(category);
		category.addMember(this);
	}
	
	public void removeCategory(Category category) {
		category.removeMember(this);
		this.selectedCategories.remove(category);
	}

}
