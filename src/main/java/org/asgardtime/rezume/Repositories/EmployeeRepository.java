package org.asgardtime.rezume.Repositories;

import org.asgardtime.rezume.model.Employee;

import java.util.List;
import java.util.Optional;

public interface EmployeeRepository {
    List<Employee> findAll();
    Optional<Employee> findById(long id);
    Employee save(Employee t);
    void deleteById(Long id);
}