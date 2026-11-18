package com.learnenglish.model;

import com.learnenglish.model.enums.CefrLevel;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "levels")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Level {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, unique = true, length = 2)
    private CefrLevel code;

    @Column(nullable = false)
    private String name;

    @Column(length = 500)
    private String description;

    @Column(name = "order_index", nullable = false)
    private Integer orderIndex;

    @OneToMany(mappedBy = "level", cascade = CascadeType.ALL)
    @Builder.Default
    private List<Course> courses = new ArrayList<>();
}
