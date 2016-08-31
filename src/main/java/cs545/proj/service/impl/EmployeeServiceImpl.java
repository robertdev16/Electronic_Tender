package cs545.proj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cs545.proj.domain.Employee;
import cs545.proj.repository.EmployeeRepository;
import cs545.proj.service.EmployeeService;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;
	
	@Override
	public Employee getEmployeeByUsername(String username) {
		List<Employee> employeeList = employeeRepository.findByUser_Username(username);
		return (employeeList.isEmpty() || employeeList == null) ? null : employeeList.get(0);
	}

	@Override
	public Employee saveOrUpdate(Employee employee) {
		return employeeRepository.saveAndFlush(employee);
	}

}
