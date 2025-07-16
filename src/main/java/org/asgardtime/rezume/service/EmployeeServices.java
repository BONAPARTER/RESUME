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
        if (repository.findByFirstName(request.getFirstName()) != null) {
        throw new IllegalArgumentException("Employee with name " + request.getFirstName() + " already exists");
        }

        Employee employee = new Employee();
        employee.setFirstName(request.getFirstName());
        employee.setLastName(request.getLastName());
        employee.setEmail(request.getEmail());
        employee.setNumber(request.getNumber());
        employee.setNickTelegram(request.getNickTelegram());
        employee.setImage(request.getImage());
        employee.setEnglishLevels(request.getEnglish_level());

        var saved = repository.save(employee);

        return mapper.toDTO(saved);
    }
}
