package com.learnenglish.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "review_items")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ReviewItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "item_type", nullable = false, length = 50)
    private String itemType; // "exercise", "vocabulary", "example"

    @Column(name = "item_id", nullable = false)
    private Long itemId;

    @Column(name = "due_date", nullable = false)
    private LocalDateTime dueDate;

    @Column(name = "interval_days")
    @Builder.Default
    private Double intervalDays = 1.0;

    @Column(nullable = false)
    @Builder.Default
    private Integer repetitions = 0;

    @Column(name = "ease_factor")
    @Builder.Default
    private Double easeFactor = 2.5;

    @Column(name = "last_reviewed_at")
    private LocalDateTime lastReviewedAt;
}
