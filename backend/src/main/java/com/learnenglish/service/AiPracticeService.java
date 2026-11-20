package com.learnenglish.service;

import com.learnenglish.dto.ai.AiChatMessage;
import com.learnenglish.dto.ai.AiChatRequest;
import com.learnenglish.dto.ai.AiChatResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Service
public class AiPracticeService {

    @Value("${ai.llm.base-url}")
    private String baseUrl;

    @Value("${ai.llm.model}")
    private String model;

    private final RestTemplate restTemplate;

    private record ScenarioConfig(String role, String context) {}

    private static final Map<String, ScenarioConfig> SCENARIOS = Map.of(
        "cafe",          new ScenarioConfig("a friendly barista at a cozy coffee shop",
                                            "The student wants to order coffee, tea, food or ask about the menu"),
        "airport",       new ScenarioConfig("a helpful airport check-in agent",
                                            "The student is checking in for a flight and needs to handle luggage and seat selection"),
        "hotel",         new ScenarioConfig("a professional hotel receptionist",
                                            "The student is checking into a hotel and asking about facilities or services"),
        "job_interview", new ScenarioConfig("a professional job interviewer at a tech company",
                                            "The student is interviewing for a software developer position"),
        "shopping",      new ScenarioConfig("a helpful shop assistant in a clothing store",
                                            "The student is shopping for clothes and asking about sizes, prices, and trying items"),
        "apartment",     new ScenarioConfig("a real estate agent showing apartments for rent",
                                            "The student is looking to rent an apartment and asking about price, location, and terms")
    );

    public AiPracticeService() {
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(10_000);
        factory.setReadTimeout(60_000);
        this.restTemplate = new RestTemplate(factory);
    }

    public AiChatResponse chat(AiChatRequest request) {
        ScenarioConfig scenario = SCENARIOS.getOrDefault(request.scenario(),
                new ScenarioConfig("a helpful English conversation partner", "General English conversation practice"));

        String systemPrompt = buildSystemPrompt(scenario, request.level());

        List<Map<String, String>> messages = new ArrayList<>();
        messages.add(Map.of("role", "system", "content", systemPrompt));
        for (AiChatMessage msg : request.messages()) {
            messages.add(Map.of("role", msg.role(), "content", msg.content()));
        }

        Map<String, Object> body = new HashMap<>();
        body.put("model", model);
        body.put("messages", messages);
        body.put("temperature", 0.7);
        body.put("max_tokens", 2000);
        body.put("enable_thinking", false);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

        ResponseEntity<Map> response = restTemplate.postForEntity(
                baseUrl + "/v1/chat/completions", entity, Map.class);

        return new AiChatResponse(extractContent(response.getBody()));
    }

    @SuppressWarnings("unchecked")
    private String extractContent(Map<?, ?> body) {
        if (body == null) return "Sorry, I couldn't generate a response. Please try again.";
        List<?> choices = (List<?>) body.get("choices");
        if (choices == null || choices.isEmpty()) return "Sorry, I couldn't generate a response.";
        Map<?, ?> choice = (Map<?, ?>) choices.get(0);
        Map<?, ?> message = (Map<?, ?>) choice.get("message");
        if (message == null) return "Sorry, I couldn't generate a response.";
        String content = String.valueOf(message.get("content"));
        // Strip <think>...</think> blocks that some reasoning models include
        return content.replaceAll("(?s)<think>.*?</think>", "").strip();
    }

    private String buildSystemPrompt(ScenarioConfig scenario, String level) {
        return """
                You are an English language tutor roleplaying as %s.
                Context: %s
                Student's English level: %s

                Rules:
                1. Stay in character. Respond naturally as your role.
                2. Keep language complexity appropriate for %s level:
                   - A1/A2: use simple vocabulary and short sentences
                   - B1/B2: use natural everyday English
                   - C1: use rich natural language with idioms where natural
                3. Keep in-character responses concise (2-4 sentences).
                4. If the student made grammar or vocabulary mistakes, include a brief correction at the end.

                Response format:
                [Your in-character response here]

                (Include ONLY if there are mistakes in the student's message)
                📝 Correction: "what they said" → "what they should say" — brief explanation.

                Do not include the correction line if the student's English is correct.
                Do not add <think> or other tags. Just respond directly.
                """.formatted(scenario.role(), scenario.context(), level, level);
    }
}
