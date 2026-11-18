package com.learnenglish.model;

import com.learnenglish.model.enums.ExerciseType;
import io.hypersistence.utils.hibernate.type.json.JsonType;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Type;

import java.util.List;
import java.util.Map;

@Entity
@Table(name = "exercises")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Exercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lesson_id", nullable = false)
    private Lesson lesson;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ExerciseType type;

    @Column(nullable = false)
    private Integer difficulty;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String question;

    @Type(JsonType.class)
    @Column(columnDefinition = "jsonb")
    private List<String> options;

    @Column(name = "correct_answer")
    private String correctAnswer;

    @Type(JsonType.class)
    @Column(columnDefinition = "jsonb")
    private Map<String, String> explanation;

    @Column(columnDefinition = "text[]")
    private String[] tags;

    @Column(name = "estimated_seconds")
    private Integer estimatedSeconds;

    @Column(name = "order_index", nullable = false)
    private Integer orderIndex;
}
