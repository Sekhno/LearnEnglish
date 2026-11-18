package com.learnenglish.model;

import com.learnenglish.model.enums.CefrLevel;
import io.hypersistence.utils.hibernate.type.json.JsonType;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Type;

import java.util.List;

@Entity
@Table(name = "vocabulary_entries")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class VocabularyEntry {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lesson_id")
    private Lesson lesson;

    @Column(nullable = false)
    private String word;

    @Column(length = 100)
    private String ipa;

    @Column(nullable = false)
    private String translation;

    @Column(name = "audio_url")
    private String audioUrl;

    @Type(JsonType.class)
    @Column(columnDefinition = "jsonb")
    private List<String> examples;

    @Enumerated(EnumType.STRING)
    @Column(name = "level_code", length = 2)
    private CefrLevel levelCode;
}
