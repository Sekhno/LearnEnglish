package com.learnenglish.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "theory_blocks")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class TheoryBlock {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lesson_id", nullable = false)
    private Lesson lesson;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String content;

    @Column(name = "order_index", nullable = false)
    private Integer orderIndex;
}
