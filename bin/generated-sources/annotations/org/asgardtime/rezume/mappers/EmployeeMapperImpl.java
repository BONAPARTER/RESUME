package org.asgardtime.rezume.mappers;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;
import org.asgardtime.rezume.dto.EmployeeDto;
import org.asgardtime.rezume.model.Employee;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-07-14T21:01:02+0300",
    comments = "version: 1.6.3, compiler: Eclipse JDT (IDE) 3.42.50.v20250628-1110, environment: Java 21.0.7 (Eclipse Adoptium)"
)
@Component
public class EmployeeMapperImpl implements EmployeeMapper {

    @Override
    public EmployeeDto toDTO(Employee employee) {
        if ( employee == null ) {
            return null;
        }

        EmployeeDto employeeDto = new EmployeeDto();

        employeeDto.setEmail( employee.getEmail() );
        employeeDto.setFirstName( employee.getFirstName() );
        employeeDto.setId( employee.getId() );
        employeeDto.setImage( employee.getImage() );
        employeeDto.setLastName( employee.getLastName() );

        return employeeDto;
    }

    @Override
    public List<EmployeeDto> toDto(List<Employee> employees) {
        if ( employees == null ) {
            return null;
        }

        List<EmployeeDto> list = new ArrayList<EmployeeDto>( employees.size() );
        for ( Employee employee : employees ) {
            list.add( toDTO( employee ) );
        }

        return list;
    }
}
