package com.learnenglish.service;

import com.learnenglish.dto.lesson.LessonResponse;
import com.learnenglish.model.Lesson;
import com.learnenglish.repository.LessonRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class LessonService {

    private final LessonRepository lessonRepository;

    @Transactional(readOnly = true)
    public LessonResponse getLessonBySlug(String slug) {
        Lesson lesson = lessonRepository.findBySlug(slug)
                .orElseThrow(() -> new IllegalArgumentException("Lesson not found: " + slug));

        String levelCode = lesson.getTopic().getModule().getCourse().getLevel().getCode().name();

        List<LessonResponse.TheoryBlockDto> theory = lesson.getTheoryBlocks().stream()
                .map(tb -> new LessonResponse.TheoryBlockDto(tb.getId(), tb.getContent(), tb.getOrderIndex()))
                .toList();

        List<LessonResponse.ExampleDto> examples = lesson.getExamples().stream()
                .map(e -> new LessonResponse.ExampleDto(
                        e.getId(), e.getEnglishText(), e.getTranslation(), e.getAudioUrl(), e.getOrderIndex()))
                .toList();

        List<LessonResponse.ExerciseDto> exercises = lesson.getExercises().stream()
                .map(ex -> new LessonResponse.ExerciseDto(
                        ex.getId(), ex.getType(), ex.getDifficulty(), ex.getQuestion(),
                        ex.getOptions(), ex.getExplanation(), ex.getEstimatedSeconds(), ex.getOrderIndex()))
                .toList();

        List<LessonResponse.VocabDto> vocabulary = lesson.getVocabularyEntries().stream()
                .map(v -> new LessonResponse.VocabDto(
                        v.getId(), v.getWord(), v.getIpa(), v.getTranslation(), v.getAudioUrl(), v.getExamples()))
                .toList();

        return new LessonResponse(lesson.getId(), lesson.getName(), lesson.getSlug(),
                levelCode, theory, examples, exercises, vocabulary);
    }
}
