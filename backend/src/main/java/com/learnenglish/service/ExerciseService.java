package com.learnenglish.service;

import com.learnenglish.dto.exercise.ExerciseSubmitRequest;
import com.learnenglish.dto.exercise.ExerciseSubmitResponse;
import com.learnenglish.model.Attempt;
import com.learnenglish.model.Exercise;
import com.learnenglish.model.ReviewItem;
import com.learnenglish.model.User;
import com.learnenglish.repository.AttemptRepository;
import com.learnenglish.repository.ReviewItemRepository;
import com.learnenglish.repository.UserRepository;
import jakarta.persistence.EntityManager;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class ExerciseService {

    private final EntityManager entityManager;
    private final AttemptRepository attemptRepository;
    private final ReviewItemRepository reviewItemRepository;
    private final UserRepository userRepository;

    @Transactional
    public ExerciseSubmitResponse submit(ExerciseSubmitRequest request) {
        Exercise exercise = entityManager.find(Exercise.class, request.exerciseId());
        if (exercise == null) throw new IllegalArgumentException("Exercise not found");

        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByEmail(email).orElseThrow();

        boolean correct = exercise.getCorrectAnswer().equalsIgnoreCase(request.answer().trim());

        Attempt attempt = Attempt.builder()
                .user(user)
                .exercise(exercise)
                .answer(request.answer())
                .correct(correct)
                .build();
        attemptRepository.save(attempt);

        if (!correct) {
            scheduleReview(user, exercise.getId());
        }

        int xp = correct ? 10 : 0;
        if (correct) {
            user.setTotalXp(user.getTotalXp() + xp);
            userRepository.save(user);
        }

        return new ExerciseSubmitResponse(correct, exercise.getCorrectAnswer(),
                exercise.getExplanation(), xp);
    }

    private void scheduleReview(User user, Long exerciseId) {
        ReviewItem review = ReviewItem.builder()
                .user(user)
                .itemType("exercise")
                .itemId(exerciseId)
                .dueDate(LocalDateTime.now().plusDays(1))
                .build();
        reviewItemRepository.save(review);
    }
}
