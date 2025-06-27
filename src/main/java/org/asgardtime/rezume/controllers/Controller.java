package org.asgardtime.rezume.controllers;

import lombok.AllArgsConstructor;
import org.asgardtime.rezume.Repositories.EmployeeRepository;
import org.asgardtime.rezume.model.Employee;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@org.springframework.stereotype.Controller
@AllArgsConstructor
public class Controller {
    EmployeeRepository repository;

    @GetMapping("/resumes/{id}")
    public String getResumeById(@PathVariable long id, Model model) {
        if (repository.findById(id).isPresent()) {
            Employee emplo = repository.findById(id).get();
            model.addAttribute("employee", emplo);
            return "resume";
        }
        return "error";
    }

    @GetMapping("/resumes")
    public String start(Model model) {
        List<Employee> employees = repository.findAll();
        model.addAttribute("employees", employees);
        return "index";
    }

    @GetMapping("/resumes/delete/{id}")
    public String delete(@PathVariable long id, Model model) {
        repository.deleteById(id);
        return "redirect:/resumes";
    }

}
