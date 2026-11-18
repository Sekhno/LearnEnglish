package com.learnenglish.controller;

import com.learnenglish.dto.lesson.CompleteLessonRequest;
import com.learnenglish.dto.lesson.LessonResponse;
import com.learnenglish.service.LessonService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/lessons")
@RequiredArgsConstructor
public class LessonController {

    private final LessonService lessonService;

    @GetMapping("/{slug}")
    public ResponseEntity<LessonResponse> getLesson(@PathVariable String slug) {
        return ResponseEntity.ok(lessonService.getLessonBySlug(slug));
    }

    @PostMapping("/{slug}/complete")
    public ResponseEntity<Void> completeLesson(@PathVariable String slug,
                                               @Valid @RequestBody CompleteLessonRequest request) {
        lessonService.completeLesson(slug, request.score());
        return ResponseEntity.ok().build();
    }
}
