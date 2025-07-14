package org.asgardtime.rezume.RepositoriesAPI;

import org.asgardtime.rezume.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    public Employee findByName(String firstName);
}