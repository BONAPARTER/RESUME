package org.asgardtime.rezume;

import org.asgardtime.rezume.Repositories.EmployeeRepository;
import org.asgardtime.rezume.model.Employee;
import org.asgardtime.rezume.model.Skill;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class InMemoryDataBase implements EmployeeRepository {
    private final List<Employee> employees = new ArrayList<Employee>();

    {
        employees.add(Employee.builder()
                .id(12L)
                .firstName("Ilya")
                .skills(List.of(Skill.JAVA_CORE, Skill.DATA_BASE))
                .build());

        employees.add(Employee.builder()
                .id(34L)
                .firstName("Kirill")
                .skills(List.of(Skill.JAVA_CORE, Skill.DATA_BASE))
                .build());

        employees.add(Employee.builder()
                .id(11L)
                .firstName("dfsfs")
                .skills(List.of(Skill.JAVA_CORE, Skill.DATA_BASE))
                .build());

    }

    @Override
    public List<Employee> findAll() {
        return employees;
    }

    @Override
    public Optional<Employee> findById(long id) {
        return employees.stream().filter(employee -> employee.getId() == id).findFirst();
    }

    @Override
    public Employee save(Employee employee) {
        if (employees.stream().anyMatch(e -> e.getId() == employee.getId())) {
            employees.remove(employee);
        }
        employees.add(employee);
        return employee;
    }

    @Override
    public void deleteById(Long id) {
        employees.removeIf(employee -> employee.getId() == id);
    }
}
