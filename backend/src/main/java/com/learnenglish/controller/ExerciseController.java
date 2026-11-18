package com.learnenglish.controller;

import com.learnenglish.dto.exercise.ExerciseSubmitRequest;
import com.learnenglish.dto.exercise.ExerciseSubmitResponse;
import com.learnenglish.service.ExerciseService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/exercises")
@RequiredArgsConstructor
public class ExerciseController {

    private final ExerciseService exerciseService;

    @PostMapping("/submit")
    public ResponseEntity<ExerciseSubmitResponse> submit(@Valid @RequestBody ExerciseSubmitRequest request) {
        return ResponseEntity.ok(exerciseService.submit(request));
    }
}
