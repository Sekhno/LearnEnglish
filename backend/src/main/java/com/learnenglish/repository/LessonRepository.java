package com.learnenglish.repository;

import com.learnenglish.model.Lesson;
import com.learnenglish.model.enums.CefrLevel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface LessonRepository extends JpaRepository<Lesson, Long> {
    Optional<Lesson> findBySlug(String slug);

    @Query("""
        SELECT l FROM Lesson l
        JOIN l.topic t
        JOIN t.module m
        JOIN m.course c
        JOIN c.level lv
        WHERE lv.code = :level AND l.published = true
        ORDER BY t.orderIndex, l.orderIndex
        """)
    List<Lesson> findPublishedByLevel(@Param("level") CefrLevel level);

    @Query("""
        SELECT COUNT(l) FROM Lesson l
        JOIN l.topic t
        JOIN t.module m
        JOIN m.course c
        JOIN c.level lv
        WHERE lv.code = :level AND l.published = true
        """)
    long countPublishedByLevel(@Param("level") CefrLevel level);
}
