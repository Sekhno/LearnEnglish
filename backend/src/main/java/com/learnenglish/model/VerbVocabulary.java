package com.learnenglish.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "verb_vocabulary")
@Data
@NoArgsConstructor
public class VerbVocabulary {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lesson_id")
    @JsonIgnore
    private Lesson lesson;

    private String v1;
    private String v2;
    private String v3;

    @Column(name = "v1_ipa")
    private String v1Ipa;

    @Column(name = "v2_ipa")
    private String v2Ipa;

    @Column(name = "v3_ipa")
    private String v3Ipa;

    private String translation;

    @Column(name = "example_v2")
    private String exampleV2;

    @Column(name = "example_trans")
    private String exampleTrans;

    @Column(name = "verb_type")
    private String verbType;

    @Column(name = "spelling_rule")
    private String spellingRule;

    private String pronunciation;

    @Column(name = "verb_pattern")
    private String verbPattern;

    private String difficulty;

    @Column(name = "alt_v2")
    private String altV2;

    @Column(name = "alt_v3")
    private String altV3;
}
