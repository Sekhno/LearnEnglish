package com.learnenglish.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "examples")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Example {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lesson_id", nullable = false)
    private Lesson lesson;

    @Column(name = "english_text", nullable = false)
    private String englishText;

    @Column(nullable = false)
    private String translation;

    @Column(name = "audio_url")
    private String audioUrl;

    @Column(name = "order_index", nullable = false)
    private Integer orderIndex;
}
