/**
 * 
 */
package cs545.proj.domain;

import java.io.Serializable;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Range;

/**
 *
 */
public class Phone implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Range(min = 100, max = 999, message = "{Size.area.validation}") 
  	private int area;
 	@Min(value = 100, message = "{Size.prefix.validation}")
 	@Max(value = 999, message = "{Size.prefix.validation}")
	private int prefix;
	@Min(value = 1000, message = "{Size.number.validation}")
	@Max(value = 9999, message = "{Size.number.validation}")
	private int number;
	

 
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
