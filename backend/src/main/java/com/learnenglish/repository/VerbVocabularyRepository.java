package com.learnenglish.repository;

import com.learnenglish.model.VerbVocabulary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VerbVocabularyRepository extends JpaRepository<VerbVocabulary, Long> {

    @Query("SELECT vv FROM VerbVocabulary vv WHERE vv.lesson.slug = :slug ORDER BY vv.verbType DESC, vv.difficulty ASC, vv.id ASC")
    List<VerbVocabulary> findByLessonSlug(@Param("slug") String slug);
}
