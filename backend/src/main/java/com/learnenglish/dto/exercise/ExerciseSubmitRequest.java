package com.learnenglish.dto.exercise;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record ExerciseSubmitRequest(
        @NotNull Long exerciseId,
        @NotBlank String answer
) {}
