package cs545.proj.service;

import cs545.proj.domain.Employee;
 
public interface EmployeeService {

	public Employee getEmployeeByUsername(String username);
	
	public Employee saveOrMerge(Employee employee);

}
