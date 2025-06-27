package org.asgardtime.rezume.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "employees", schema = "public")
// @NamedQueries({
// @NamedQuery(name = "Employee.findAll", query = "SELECT e FROM Employee e " +
// "LEFT JOIN FETCH e.projects pr")
// })
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String number;
    private String nickTelegram;
    private String image;
    @ElementCollection
    @CollectionTable(name = "skills", joinColumns = @JoinColumn(name = "id_employee"))
    private List<Skill> skills;
    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private List<Project> projects;
    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private List<Education> educations;
    @Column(name = "english_level")
    @Enumerated(EnumType.ORDINAL)
    private EnglishLevel englishLevels;
}
