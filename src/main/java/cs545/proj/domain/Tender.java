package cs545.proj.domain;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity

public class Tender implements Serializable {

	private static final long serialVersionUID = -3532377236419382983L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int tenderId;

	@NotEmpty(message = "The tender name must not be empty")
	private String tenderName;

	private List<Catagory> categoryList;
	private String tenderDescription;

    @DateTimeFormat(pattern = "MM-dd-yyyy")
	private Date tenderPostDate;
    @DateTimeFormat(pattern = "MM-dd-yyyy")
	private Date tenderDeadline;

	private String tenderOrganization;

    @JsonIgnore
    private MultipartFile tenderDocument;
    
	@Lob
	@Column(length = 100000)
	@Cache(usage=CacheConcurrencyStrategy.NONE)
	@JsonIgnore
	private Blob imagebytes;

	public int getTenderId() {
		return tenderId;
	}

	public void setTenderId(int tenderId) {
		this.tenderId = tenderId;
	}

	public String getTenderName() {
		return tenderName;
	}

	public void setTenderName(String tenderName) {
		this.tenderName = tenderName;
	}

	public List<Catagory> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Catagory> categoryList) {
		this.categoryList = categoryList;
	}

	public String getTenderDescription() {
		return tenderDescription;
	}

	public void setTenderDescription(String tenderDescription) {
		this.tenderDescription = tenderDescription;
	}

	public Date getTenderPostDate() {
		return tenderPostDate;
	}

	public void setTenderPostDate(Date tenderPostDate) {
		this.tenderPostDate = tenderPostDate;
	}

	public Date getTenderDeadline() {
		return tenderDeadline;
	}

	public void setTenderDeadline(Date tenderDeadline) {
		this.tenderDeadline = tenderDeadline;
	}

	public String getTenderOrganization() {
		return tenderOrganization;
	}

	public void setTenderOrganization(String tenderOrganization) {
		this.tenderOrganization = tenderOrganization;
	}

	public MultipartFile getTenderDocument() {
		return tenderDocument;
	}

	public void setTenderDocument(MultipartFile tenderDocument) {
		this.tenderDocument = tenderDocument;
	}

	public Blob getImagebytes() {
		return imagebytes;
	}

	public void setImagebytes(Blob imagebytes) {
		this.imagebytes = imagebytes;
	}

   

	

} // The End of Class;
