package com.learnenglish.service;

import com.learnenglish.dto.lesson.LessonResponse;
import com.learnenglish.model.Lesson;
import com.learnenglish.model.UserProgress;
import com.learnenglish.repository.LessonRepository;
import com.learnenglish.repository.UserProgressRepository;
import com.learnenglish.repository.UserRepository;
import java.time.LocalDateTime;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class LessonService {

    private final LessonRepository lessonRepository;
    private final UserRepository userRepository;
    private final UserProgressRepository progressRepository;

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

    @Transactional
    public void completeLesson(String slug, int score) {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        var user = userRepository.findByEmail(email).orElseThrow();
        Lesson lesson = lessonRepository.findBySlug(slug)
                .orElseThrow(() -> new IllegalArgumentException("Lesson not found: " + slug));

        UserProgress progress = progressRepository
                .findByUserIdAndLessonId(user.getId(), lesson.getId())
                .orElse(UserProgress.builder()
                        .user(user)
                        .lesson(lesson)
                        .startedAt(LocalDateTime.now())
                        .build());

        progress.setCompleted(true);
        progress.setScore(score);
        progress.setCompletedAt(LocalDateTime.now());
        progressRepository.save(progress);

        // Advance currentLevel if all lessons in this level are now complete
        advanceLevelIfComplete(user, lesson);
    }

    private void advanceLevelIfComplete(com.learnenglish.model.User user, Lesson lesson) {
        com.learnenglish.model.enums.CefrLevel lessonLevel =
                lesson.getTopic().getModule().getCourse().getLevel().getCode();
        com.learnenglish.model.enums.CefrLevel userLevel =
                com.learnenglish.model.enums.CefrLevel.valueOf(user.getCurrentLevel());

        if (lessonLevel != userLevel) return;

        long total = lessonRepository.countPublishedByLevel(userLevel);
        long completed = progressRepository.findByUserIdAndLevel(user.getId(), userLevel)
                .stream().filter(com.learnenglish.model.UserProgress::getCompleted).count();

        if (total > 0 && completed >= total) {
            com.learnenglish.model.enums.CefrLevel[] levels =
                    com.learnenglish.model.enums.CefrLevel.values();
            int nextIdx = userLevel.ordinal() + 1;
            if (nextIdx < levels.length) {
                user.setCurrentLevel(levels[nextIdx].name());
                userRepository.save(user);
            }
        }
    }
}
