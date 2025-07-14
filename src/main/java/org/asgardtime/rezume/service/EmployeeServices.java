package org.asgardtime.rezume.service;

import java.util.List;

import org.asgardtime.rezume.RepositoriesAPI.EmployeeRepository;
import org.asgardtime.rezume.dto.EmployeeDto;
import org.asgardtime.rezume.mappers.EmployeeMapper;
import org.asgardtime.rezume.model.Employee;
import org.asgardtime.rezume.request.CreateEmployeeRequest;
import org.springframework.stereotype.Service;

import jakarta.persistence.EntityNotFoundException;
import lombok.AllArgsConstructor;

import java.util.Optional;

@Service
@AllArgsConstructor
public class EmployeeServices {
    private final EmployeeRepository repository;
    private final EmployeeMapper mapper;

    public EmployeeDto getEmployeeById(Long id) {
        Employee employee = repository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Employee not found."));
        System.out.println("**********************************************************************");
        System.out.println(employee);
        System.out.println("**********************************************************************");
        return mapper.toDTO(employee);
    }

    public List<EmployeeDto> getAllEmployees() {
        List<Employee> employees = repository.findAll();
        employees.forEach(System.out::println);
        return mapper.toDto(employees);
    }

    public EmployeeDto createEmployee(CreateEmployeeRequest request) {
        if (repository.findByName(request.getFirstName()) != null) {
        throw new IllegalArgumentException("Employee with name " + request.getFirstName() + " already exists");
        }

        Employee employee = new Employee(
        4,
        request.getFirstName(),
        request.getLastName(),
        request.getEmail(),
        "+375291234567",
        "@floppa",
        "/images/back.png",
        2);

        var saved = repository.save(employee);

        return mapper.toDTO(saved);
    }
}
