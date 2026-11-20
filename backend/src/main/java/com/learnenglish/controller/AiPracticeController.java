package com.learnenglish.controller;

import com.learnenglish.dto.ai.AiChatRequest;
import com.learnenglish.dto.ai.AiChatResponse;
import com.learnenglish.service.AiPracticeService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/ai")
@RequiredArgsConstructor
public class AiPracticeController {

    private final AiPracticeService aiPracticeService;

    @PostMapping("/chat")
    public ResponseEntity<AiChatResponse> chat(@Valid @RequestBody AiChatRequest request) {
        return ResponseEntity.ok(aiPracticeService.chat(request));
    }
}
