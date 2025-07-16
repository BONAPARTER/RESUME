package org.asgardtime.rezume.request;

import org.asgardtime.rezume.model.EnglishLevel;

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
    @NotBlank
    @Size(min = 1, max = 30)
    private String number;
    @NotBlank
    @Size(min = 1, max = 30)
    private String nickTelegram;
    @NotBlank
    @Size(min = 1, max = 30)
    private String image;
    @NotBlank
    private EnglishLevel english_level;
}