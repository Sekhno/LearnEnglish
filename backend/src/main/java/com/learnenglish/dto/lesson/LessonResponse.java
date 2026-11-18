package com.learnenglish.dto.lesson;

import com.learnenglish.model.enums.ExerciseType;

import java.util.List;
import java.util.Map;

public record LessonResponse(
        Long id,
        String name,
        String slug,
        String levelCode,
        List<TheoryBlockDto> theory,
        List<ExampleDto> examples,
        List<ExerciseDto> exercises,
        List<VocabDto> vocabulary
) {
    public record TheoryBlockDto(Long id, String content, int orderIndex) {}

    public record ExampleDto(Long id, String englishText, String translation, String audioUrl, int orderIndex) {}

    public record ExerciseDto(
            Long id,
            ExerciseType type,
            int difficulty,
            String question,
            List<String> options,
            Map<String, String> explanation,
            int estimatedSeconds,
            int orderIndex
    ) {}

    public record VocabDto(Long id, String word, String ipa, String translation, String audioUrl, List<String> examples) {}
}
