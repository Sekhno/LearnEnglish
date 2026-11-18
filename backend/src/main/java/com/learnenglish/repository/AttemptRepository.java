package com.learnenglish.repository;

import com.learnenglish.model.Attempt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AttemptRepository extends JpaRepository<Attempt, Long> {
    List<Attempt> findByUserIdAndExerciseId(Long userId, Long exerciseId);

    @Query("SELECT COUNT(a) FROM Attempt a WHERE a.user.id = :userId AND a.correct = false")
    long countIncorrectByUserId(@Param("userId") Long userId);
}
