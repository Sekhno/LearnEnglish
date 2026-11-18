package com.learnenglish.dto.exercise;

import java.util.Map;

public record ExerciseSubmitResponse(
        boolean correct,
        String correctAnswer,
        Map<String, String> explanation,
        int xpEarned
) {}
