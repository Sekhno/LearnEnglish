package com.learnenglish.dto.ai;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import java.util.List;

public record AiChatRequest(
    @NotBlank String scenario,
    @NotBlank String level,
    @NotNull @NotEmpty List<AiChatMessage> messages
) {}
