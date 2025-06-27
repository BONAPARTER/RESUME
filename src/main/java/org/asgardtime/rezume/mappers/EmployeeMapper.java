package org.asgardtime.rezume.mappers;

import java.util.List;

import org.asgardtime.rezume.dto.EmployeeDto;
import org.asgardtime.rezume.model.Employee;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface EmployeeMapper {
    EmployeeDto toDTO(Employee employee);

    List<EmployeeDto> toDto(List<Employee> employees);
}
