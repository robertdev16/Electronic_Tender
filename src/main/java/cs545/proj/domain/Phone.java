package cs545.proj.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Digits;

import org.hibernate.validator.constraints.Length;

@Entity
public class Phone implements Serializable {
	
	private static final long serialVersionUID = -7784294464920240869L;
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
	
	@Length(min=3, max=3)
	@Digits(fraction = 0, integer = 3)
	private String area;
	
	@Length(min=3, max=3)
	@Digits(fraction = 0, integer = 3)
	private String prefix;
	
	@Length(min=4, max=4)
	@Digits(fraction = 0, integer = 4)
	private String number;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

}
