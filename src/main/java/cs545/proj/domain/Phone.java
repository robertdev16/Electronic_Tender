
package cs545.proj.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Range;

@Entity
public class Phone implements Serializable {
	
	private static final long serialVersionUID = -7784294464920240869L;
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
	
	@Range(min = 100, max = 999)
  	private int area;
	
	@Range(min = 100, max = 999)
	private int prefix;
 	
	@Range(min = 1000, max = 9999)
	private int number;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

 	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getPrefix() {
		return prefix;
	}

	public void setPrefix(int prefix) {
		this.prefix = prefix;
	}
}
