package cs545.proj.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Category implements Serializable {

	private static final long serialVersionUID = 5465884713810745242L;

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@NotBlank
    private String name;
	
	@NotBlank
	private String description;
	
	@ManyToMany
	private List<Tender> tenderList;

	@ManyToMany
    private List<Member> subscribedMembers;


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Tender> getTenderList() {
		return tenderList;
	}

	public void setTenderList(List<Tender> tenderList) {
		this.tenderList = tenderList;
	}

	public List<Member> getSubscribedMembers() {
		return subscribedMembers;
	}

	public void setSubscribedMembers(List<Member> subscribedMembers) {
		this.subscribedMembers = subscribedMembers;
	}

}
