package org.asgardtime.rezume.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class CreateEmployeeRequest {
    @NotBlank
    @Size(min = 1, max = 30)
    private String firstName;
    @NotBlank
    @Size(min = 1, max = 30)
    private String lastName;
    @NotBlank
    @Size(min = 1, max = 30)
    private String email;
}