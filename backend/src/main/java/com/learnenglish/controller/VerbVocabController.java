package com.learnenglish.controller;

import com.learnenglish.model.VerbVocabulary;
import com.learnenglish.repository.VerbVocabularyRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/verb-vocab")
public class VerbVocabController {

    private final VerbVocabularyRepository repo;

    public VerbVocabController(VerbVocabularyRepository repo) {
        this.repo = repo;
    }

    @GetMapping("/{slug}")
    public ResponseEntity<List<VerbVocabulary>> getBySlug(@PathVariable String slug) {
        return ResponseEntity.ok(repo.findByLessonSlug(slug));
    }
}
