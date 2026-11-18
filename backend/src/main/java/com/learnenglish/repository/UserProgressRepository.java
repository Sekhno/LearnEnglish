package com.learnenglish.repository;

import com.learnenglish.model.UserProgress;
import com.learnenglish.model.enums.CefrLevel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface UserProgressRepository extends JpaRepository<UserProgress, Long> {

    Optional<UserProgress> findByUserIdAndLessonId(Long userId, Long lessonId);

    List<UserProgress> findByUserIdAndCompletedTrue(Long userId);

    @Query("""
        SELECT up FROM UserProgress up
        JOIN up.lesson l
        JOIN l.topic t
        JOIN t.module m
        JOIN m.course c
        JOIN c.level lv
        WHERE up.user.id = :userId AND lv.code = :level
        """)
    List<UserProgress> findByUserIdAndLevel(@Param("userId") Long userId,
                                            @Param("level") CefrLevel level);

    @Query("""
        SELECT COUNT(up) FROM UserProgress up
        WHERE up.user.id = :userId AND up.completed = true
        """)
    long countCompletedByUserId(@Param("userId") Long userId);
}
