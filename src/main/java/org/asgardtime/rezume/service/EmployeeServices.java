package org.asgardtime.rezume.service;

import java.util.List;

import org.asgardtime.rezume.RepositoriesAPI.EmployeeRepository;
import org.asgardtime.rezume.dto.EmployeeDto;
import org.asgardtime.rezume.mappers.EmployeeMapper;
import org.asgardtime.rezume.model.Employee;
import org.springframework.stereotype.Service;

import jakarta.persistence.EntityNotFoundException;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class EmployeeServices {
    private final EmployeeRepository repository;
    private final EmployeeMapper mapper;

    public EmployeeDto getEmployeeById(Long id) {
        Employee employee = repository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Employee not found."));
        return mapper.toDTO(employee);
    }

    public List<EmployeeDto> getAllEmployees() {
        List<Employee> employees = repository.findAll();
        employees.forEach(System.out::println);
        return mapper.toDto(employees);
    }
}
